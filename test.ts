/* import { Permissions } from "./src/constants/permissions.ts";

const user = 11n;
const group = 8n;
const perms = user | group;

if (perms & Permissions.ADMIN) {
  console.log("User hat Perms");
} else {
  console.log("User hat keine Perms");
} */

import { createSecret } from "https://deno.land/x/fernet@0.2.0/mod.ts";
import { Groups } from "./src/database/cache/groups.ts";
import db from "./src/database/database.ts";
import { formatTime, logger, sendMail } from "./src/utils/mod.ts";

/* const perms = 7n;

const granted: string[] = [];
for (const [name, bit] of Object.entries(Permissions)) {
  if (!(perms & bit)) continue;

  granted.push(name);
}

console.log(granted);
 */

/* const userGroups = ["USER", "ADMIN", "TEST"];

const userPermissions = 40n;

const perms =
  userPermissions |
  (await Promise.all(userGroups.map((group) => getGroupPerms(group))).then((res) =>
    res.reduce((all, current) => all | current, 0n)
  ));

console.log(perms);

function getGroupPerms(group: string) {
  return Groups.get(group) ?? 0n;
}
 */
/* const textDecoder = new TextDecoder();
logger.info(
  JSON.parse(
    textDecoder.decode(
      fernet.decode(
        "gAAAAABhaLhaxaendckzQw95cmxonMdkgPzfQjluqLHBl8OEgy7R1sFnOdEMy44E1hItkuYwLsNrX2xDM5NPJb1__veO4HjHZqKLQ31XtuYgt9Pw-pZbbAzpH3qe_L0GgvyvaYTa2pIXFJ56CFjy_LD4neJdWmmHhTLxkVWk1s1_Af_3w3u8X1GuxWVMu-1dr1IX5aP_6hlsj6ciX_F9UwPBuXGa8jTVYRvLWVlTwL3gmX-NcFNvN9BfowdI6pUI9UgRaq7ohaanR8lFSbf8CAk15FxQME_Y3_qI3gYe6DeLKq3c7JbtBlFZfV7i-V7JE_bkadByja0Z76DTkBQNDuI6EOry04uA5cgsVJ5jk20wGYOS3ucvbCpvIJnPI9aiIJHCsmfaRlVt96-Jk0pqLyrBE66-c6GodnoOQj2nnrjKH_KGVsqj6HBgiiH3dWn2uqEftHYp7P0M"
      )
    )
  )
);
 */

/* const array = ["One", "Two", "Three"];

const set = new Set(array); */

/* console.log("SECRET 1 ", createSecret());
console.log("SECRET 2 ", createSecret());
console.log("SECRET 3 ", createSecret()); */

/* const body = {
  username: "newt",
  email: "some",
  password: "4QLRhsWbNS4Gffj3oxvU2x$RXu2JPma%tv8EFGir6T8Qf@2!qRRoHqhzC$kiQ2aa",
};

const [passes, errors] = await validate(body, {
  username: [required, lengthBetween(3, 32)],
  email: [required, isEmail],
  password: [required, lengthBetween(8, 63)],
});

for (const error of Object.values(errors)) {
  console.log(error);
}

console.log({ passes, errors });
 */

/* console.log(
  `https://github.com/login/oauth/authorize?client_id=${encodeURIComponent(
    "7faaab5a9ee93540d9ba"
  )}&redirect_uri=${encodeURIComponent("http://localhost/auth/callback/github")}&scope=${encodeURIComponent(
    "read:user user:email"
  )}&state=abcj56as`
); */

/* const token = await fetch(
  "https://api.twitter.com/oauth/request_token?oauth_consumer_key=C5ygqXCJlnwhAeXd4OoFI3WC2&oauth_nonce=kHBiHEpyTGW&oauth_signature=vGBI8VFj6Vr1wUC9pSWswVTBTao%3D&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1636209007&oauth_version=1.0",
  {
    method: "POST",
  }
).then((res) => res.json());

logger.info(token);
 */

await sendMail("dspitzli9@gmail.com", "Test Mail", "SOME TEST", "<h1>Test</h1>");
