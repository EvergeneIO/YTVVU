import configs from "../../configs.ts";
import { Router } from "../../deps.ts";
import { sendEta } from "../helpers/send_eta.ts";
import { userGuard } from "../middlewares/middlewares.ts";
import { Context } from "../types/mod.ts";

export const router = new Router();

router.get("/", async (context: Context) => {
  await sendEta(context, "index", {});
});

router.get("/register", async (context: Context) => {
  //let username = context.state.user!.username;
  // * ! sagt einfach, dass du weißst dass das defined is gtg ja
  await sendEta(context, "register", {
    page: { title: "Register" },
    captcha: { siteKey: configs.captcha.siteKey },
  });
});

export default router;
