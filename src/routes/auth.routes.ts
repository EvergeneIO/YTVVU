// deno-lint-ignore-file camelcase
import configs from "../../configs.ts";
import { bcrypt, helpers, httpErrors, nanoid, Router, validator } from "../../deps.ts";
import { Context } from "../types/mod.ts";
import { sendEta, setTokens } from "../helpers/mod.ts";
import { db } from "../database/database.ts";
import { cachedSessions } from "../middlewares/fernet.middleware.ts";
import { buildBody, generateMaylily, getErrorMessage, hashPassword, logger, quickId, sendMail } from "../utils/mod.ts";
import { captcha, rateLimit, requestValidator, userGuard } from "../middlewares/middlewares.ts";
import { DEFAULT_PERMISSIONS } from "../constants/permissions.ts";
import { redis } from "../database/cache/redis.ts";

export const router = new Router({ prefix: "/auth" });

router.get("/google", userGuard(["Client"], "USER"), (context: Context) => {
  context.response.body = { message: true };
});

router.get("/callback/google", async (context: Context) => {
  if (context.state.user) return context.response.redirect("/");
  const accessCode = helpers.getQuery(context).code;

  if (!accessCode) {
    const error = helpers.getQuery(context).error;
    if (!error) throw new httpErrors.BadRequest(`no acces code from Discord`);
    throw new httpErrors.BadRequest(error);
  }

  const data = new FormData();
  data.append("client_id", configs.oauth.discord.clientId);
  data.append("client_secret", configs.oauth.discord.clientSecret);
  data.append("grant_type", "authorization_code");
  data.append("redirect_uri", configs.oauth.discord.redirectUri);
  data.append("scope", configs.oauth.discord.scopes.join(" "));
  data.append("code", accessCode);

  interface Token {
    access_token: string;
    token_type: string;
    expires_in: number;
    refresh_token: string;
    scope: string;
  }

  const { token_type, access_token, refresh_token }: Token = await fetch("https://discord.com/api/oauth2/token", {
    method: "POST",
    body: data,
  }).then((res) => res.json());

  const response = await fetch("https://discord.com/api/users/@me", {
    method: "GET",
    headers: {
      authorization: `${token_type} ${access_token}`,
    },
  }).then((res) => res.json());

  await fetch(`https://discord.com/api/guilds/${configs.discord.server}/members/${response.id}`, {
    method: "PUT",
    headers: {
      "Content-Type": "application/json",
      Authorization: `Bot ${configs.discord.bot}`,
    },
    body: JSON.stringify({ access_token }),
  });
  response.avatarUrl = response.avatar
    ? `https://cdn.discord.com/avatars/${response.id}/${response.avatar}.png?size=1024`
    : `https://cdn.statically.io/avatar/${response.username}`;

  const sessionId = quickId();

  const [checkUser] = await db
    .select(db.users.id, db.users.permissions, db.users.avatarUrl, db.users.groups)
    .from(db.users)
    .where(db.users.username.eq(response.username));

  if (checkUser) {
    await setTokens(
      {
        id: checkUser.id,
        username: response.username,
        email: response.email,
        permissions: checkUser.permissions,
        avatarUrl: checkUser.avatarUrl,
        groups: checkUser.groups,
        sessionId,
      },
      context
    );
    //return await sendEta(context, "callback");
    return context.response.redirect("/");
  }

  const [user] = await db
    .insertInto(db.users)
    .values({
      id: await generateMaylily(),
      username: response.username,
      email: response.email,
      avatarUrl: response.avatarUrl,
      permissions: DEFAULT_PERMISSIONS,
    })
    .returning("id");

  if (!user.id) {
    throw new httpErrors.InternalServerError("Something went wrong");
  }

  const [linked] = await db
    .insertInto(db.linkedAccounts)
    .values({
      userId: user.id,
      provider: "discord",
      email: response.email,
      accessToken: access_token,
      refreshToken: refresh_token,
    })
    .returning("userId");

  if (!linked.userId) {
    throw new httpErrors.InternalServerError("Something went wrong");
  }

  await db.insertInto(db.settings).values({ id: user.id });
  await setTokens(
    {
      id: user.id,
      username: response.username,
      email: response.email,
      permissions: DEFAULT_PERMISSIONS,
      avatarUrl: response.avatarUrl,
      groups: ["USER"],
      sessionId: quickId(),
    },
    context
  );

  const verifyToken = `${Date.now().toString(32)}.${nanoid(128)}`;

  await redis.setex(verifyToken, 300, `${user.id}`);

  sendMail(
    response.email,
    "Register Verify",
    "Register Verify",
    `<a href="${configs.general.hostname == "localhost" ? "http" : "https"}://${
      configs.general.hostname
    }/api/mail/verify?code=${verifyToken}">Verify your Mail adress</a>`
  );

  context.response.body = { msg: "ok" };
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
    captcha: validator.required,
  }),
  captcha(),
  async (context: Context) => {
    interface Body {
      username: string;
      email: string;
      password: string;
      captcha: string;
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
    return (context.response.body = { status: "ok", message: "Success" });
  }
);

router.post(
  "/login",
  rateLimit(600, 10),
  requestValidator({
    username: validator.required,
    password: validator.required,
    captcha: validator.required,
  }),
  captcha(),
  async (context: Context) => {
    interface Body {
      username: string;
      password: string;
      captcha: string;
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
