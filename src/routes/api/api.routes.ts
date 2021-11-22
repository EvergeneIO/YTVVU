import { Router } from "../../../deps.ts";
import { Context } from "../../types/mod.ts";

export const router = new Router({ prefix: "/api" });

router.get("/", (context: Context) => {
  context.response.body = "template";
});

export default router;
