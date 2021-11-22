import { helpers, httpErrors, Router } from "../../../deps.ts";
import { redis } from "../../database/cache/redis.ts";
import db from "../../database/database.ts";
import { Context } from "../../types/mod.ts";

export const router = new Router({ prefix: "/api/mail" });

router.get("/verify", async (context: Context) => {
  const code = helpers.getQuery(context).code;
  const verify = await redis.get(code);

  if (!verify) throw new httpErrors.Unauthorized("invalid verify key");

  const update = await db.update(db.settings).set({ emailverify: true }).returning("id");

  if (!update) throw new httpErrors.InternalServerError("something went wrong");

  context.response.redirect("/?message=email_verified");
});

export default router;
