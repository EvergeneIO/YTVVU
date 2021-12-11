// deno-lint-ignore-file camelcase
import configs from "../../configs.ts";
import { bcrypt, helpers, httpErrors, nanoid, Router, validator } from "../../deps.ts";
import { DEFAULT_PERMISSIONS } from "../constants/permissions.ts";
import { redis } from "../database/cache/redis.ts";
import { db } from "../database/database.ts";
import { setTokens } from "../helpers/mod.ts";
import { cachedSessions } from "../middlewares/fernet.middleware.ts";
import { rateLimit, requestValidator, userGuard } from "../middlewares/middlewares.ts";
import { Channel, Context, ChannelItem } from "../types/mod.ts";
import { buildBody, generateMaylily, hashPassword, logger, quickId, sendMail } from "../utils/mod.ts";

export const router = new Router({ prefix: "/auth" });

router.get("/google", userGuard(["Client"], "USER"), (context: Context) => {
  context.response.redirect(
    //"https://accounts.google.com/o/oauth2/v2/auth?access_type=offline&scope=https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fyoutube.force-ssl%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.email%20https%3A%2F%2Fwww.googleapis.com%2Fauth%2Fuserinfo.profile&response_type=code"
    `https://accounts.google.com/o/oauth2/v2/auth?access_type=offline&scope=${encodeURIComponent(
      configs.oauth.google.scopes.join(" ")
    )}&response_type=code&client_id=${configs.oauth.google.clientId}&redirect_uri=${encodeURIComponent(
      configs.oauth.google.redirectUri
    )}`
  );
});

router.get("/callback", userGuard(["Client"], "USER"), async (context: Context) => {
  const redirect = await context.cookies.get("redirect");
  context.cookies.delete("redirect");

  // ?error=access_denied
  if (helpers.getQuery(context).error) return context.response.redirect("/?error=access_denied");
  const code = helpers.getQuery(context).code;
  const details = {
    code,
    client_id: configs.oauth.google.clientId,
    client_secret: configs.oauth.google.clientSecret,
    redirect_uri: configs.oauth.google.redirectUri,
    grant_type: "authorization_code",
  };

  interface Token {
    access_token: string;
    refresh_token: string;
  }

  const { access_token, refresh_token }: Token = await fetch("https://oauth2.googleapis.com/token", {
    method: "POST",
    headers: {
      "Content-Type": "application/x-www-form-urlencoded;charset=UTF-8",
    },
    body: buildBody(details),
  }).then((res) => res.json());

  const resChannel: Channel = await fetch(
    `https://youtube.googleapis.com/youtube/v3/channels?part=${encodeURIComponent(
      configs.oauth.google.parts.channel.join(",")
    )}&mine=true`,
    {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${access_token}`,
      },
    }
  ).then((res) => res.json());

  const [channel]: ChannelItem[] = resChannel.items;

  // const videos = new Map();
  // const videosInfo = await fetch(
  //   "https://youtube.googleapis.com/youtube/v3/activities?part=snippet%2CcontentDetails&maxResults=25&mine=true",
  //   {
  //     method: "GET",
  //     headers: {
  //       "Content-Type": "application/json",
  //       Authorization: `Bearer ${res.access_token}`,
  //     },
  //   }
  // ).then((res) => res.json());

  const [checkChannel] = await db
    .select(
      db.channels.userId,
      db.channels.channelId,
      db.channels.name,
      db.channels.profilePicture,
      db.channels.banner,
      db.channels.uploads,
      db.channels.accessToken,
      db.channels.refreshToken
    )
    .from(db.channels)
    .where(db.channels.channelId.eq(channel.id));

  logger.info(checkChannel);

  if (checkChannel.userId)
    return context.response.redirect(`/?error=${encodeURIComponent("channel already registered")}`);

  if (!channel.brandingSettings.image) {
    channel.brandingSettings.image = {
      bannerExternalUrl: "https://cdn.statically.io/img/i.ibb.co/b5k58Rh/default-banner.png",
    };
    if (!channel.brandingSettings.image.bannerExternalUrl) {
      channel.brandingSettings.image.bannerExternalUrl =
        "https://cdn.statically.io/img/i.ibb.co/b5k58Rh/default-banner.png";
    }
  }
  const [newChannel] = await db
    .insertInto(db.channels)
    .values({
      userId: context.state.user!.id,
      channelId: channel.id,
      name: channel.snippet.title,
      profilePicture: channel.snippet.thumbnails.medium.url,
      banner: channel.brandingSettings.image.bannerExternalUrl,
      uploads: channel.contentDetails.relatedPlaylists.uploads,
      accessToken: access_token,
      refreshToken: refresh_token,
    })
    .returning("userId");
  if (!newChannel.userId) throw new httpErrors.InternalServerError("something went wrong when registering the channel");

  context.response.redirect(
    redirect
      ? `${redirect}?info=${encodeURIComponent("channel was added successfully")}`
      : `/?info=${encodeURIComponent("channel was added successfully")}`
  );
});

router.get("/logout", async (context: Context) => {
  context.cookies.delete("token");
  if (!context.state.user) return;
  const [deletedSession] = await db
    .deleteFrom(db.sessions)
    .where(
      db.sessions.userId.eq(BigInt(context.state.user.id)).and(db.sessions.sessionId.eq(context.state.user.sessionId))
    )
    .returning("sessionId");

  cachedSessions.delete(deletedSession.sessionId);

  //context.response.redirect(configs.logoutRedirectUri);
});

router.post(
  "/register",
  rateLimit(600, 10),
  requestValidator({
    username: [validator.required, validator.lengthBetween(3, 32)],
    email: [validator.required, validator.isEmail],
    password: [validator.required, validator.lengthBetween(8, 63)],
    //captcha: validator.required,
  }),
  async (context: Context) => {
    interface Body {
      username: string;
      email: string;
      password: string;
      captcha?: string;
    }

    const body: Body = await context.request.body({ type: "json" }).value.catch(() => ({}));

    const [checkUser] = await db
      .select(db.users.username, db.users.email)
      .from(db.users)
      .where(db.users.email.eq(body.email).or(db.users.username.eq(body.username)));

    if (checkUser) {
      throw new httpErrors.BadRequest("username or email already in use");
    }

    const avatarUrl = `https://cdn.statically.io/avatar/${body.username}`;
    const [user] = await db
      .insertInto(db.users)
      .values({
        id: await generateMaylily(),
        username: body.username,
        email: body.email,
        password: await hashPassword(body.password),
        avatarUrl,
        permissions: DEFAULT_PERMISSIONS,
      })
      .returning("id");
    if (!user.id) {
      throw new httpErrors.InternalServerError("Something went wrong");
    }
    await db.insertInto(db.settings).values({ id: user.id });
    await setTokens(
      {
        id: user.id,
        username: body.username,
        email: body.email,
        permissions: DEFAULT_PERMISSIONS,
        avatarUrl,
        groups: ["USER"],
        sessionId: quickId(),
      },
      context
    );
    context.response.status = 200;
    return (context.response.body = { status: 200, message: "Success" });
  }
);

router.post(
  "/login",
  rateLimit(600, 10),
  requestValidator({
    username: validator.required,
    password: validator.required,
    //captcha: validator.required,
  }),
  async (context: Context) => {
    interface Body {
      username: string;
      password: string;
      captcha?: string;
    }
    const body: Body = await context.request.body({ type: "json" }).value.catch(() => ({}));

    const [user] = await db
      .select(
        db.users.id,
        db.users.username,
        db.users.email,
        db.users.permissions,
        db.users.avatarUrl,
        db.users.password,
        db.users.groups
      )
      .from(db.users)
      .where(db.users.email.eq(body.username).or(db.users.username.eq(body.username)));

    if (!user.username || !user.password) throw new httpErrors.BadRequest("username or password is wrong");

    if (!(await bcrypt.compare(body.password, user.password)))
      throw new httpErrors.BadRequest("username or password is wrong");

    await setTokens(
      {
        id: user.id,
        username: user.username,
        email: user.email,
        permissions: user.permissions,
        avatarUrl: user.avatarUrl,
        groups: user.groups,
        sessionId: quickId(),
      },
      context
    );
    context.response.status = 200;
    return (context.response.body = { status: "ok", message: "Success" });
  }
);

/* router.post("/resetpwd", (context: Context) => {
  const mail = "abc@xyz.com"

  if(mail === "google") {
    return "Jo du hast dich mit google eingeloggt, log dich einfach mit google ein und setze ein password falls du das nötig hast"
    //redirect /login
  } else {
    //reset form
  }


}) */

export default router;
