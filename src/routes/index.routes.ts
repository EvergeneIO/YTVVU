import configs from "../../configs.ts";
import { Router } from "../../deps.ts";
import { sendEta } from "../helpers/send_eta.ts";
import { userGuard } from "../middlewares/middlewares.ts";
import { Context } from "../types/mod.ts";

export const router = new Router();

router.get("/", async (context: Context) => {
  await context.cookies.set(
    "token",
    `Client gAAAAABhsM7ccI1UeEeYfEzotkcNRJd5SXi-9q9AzWWZLKos8ajkxe_mH-PZhiW4TlWcrDIS3WOxPoryx8Mp8Nd-YnUSPAP7FC7JIc9MH-ENw3lWRSdZzanJavPogVNqIKFSfY97PB20tTeb0Ro7EYVQLy4-t3Y4gZ50i-1Dxv74NuVRPul3C9aN2gf1aLAZ6njKnG1cClvbL7LtLrQP1YSkqL1AJWjFnOjA4I1GjO70XtMOx6o6-3PgVMsfLgpT0AJ7y5Ih9UU4XQfiZka6stZXq5OrDht7zp9oo2_tfZRnhH9xuG6PQeL7BUY5C6z2GK0fti6wxhEp6Rm2RLxyK3Ir_SvFnGwOIt0fNwebUTPV6FONjHAo-rcS1CFedowj_tDm7S8IhrIN`
  );
  await sendEta(context, "index", { user: context.state.user, page: { title: "home" } });
});

router.get("/test", async (context: Context) => {
  await sendEta(context, "500", { user: context.state.user, page: { title: "Error" } });
});

router.get("/register", async (context: Context) => {
  //let username = context.state.user!.username;
  // * ! sagt einfach, dass du weißst dass das defined is gtg ja
  await sendEta(context, "register", {
    page: { title: "Register" },
    captcha: { siteKey: configs.captcha.siteKey },
  });
});

router.get("/login", async (context: Context) => {
  //let username = context.state.user!.username;
  // * ! sagt einfach, dass du weißst dass das defined is gtg ja
  await sendEta(context, "login", {
    page: { title: "Login" },
    captcha: { siteKey: configs.captcha.siteKey },
  });
});

export default router;
