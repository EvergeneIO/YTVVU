router.get("/twitter", async (context: Context) => {
  const token = await fetch(
    "https://api.twitter.com/oauth/request_token?null=null&oauth_consumer_key=C5ygqXCJlnwhAeXd4OoFI3WC2&oauth_signature_method=HMAC-SHA1&oauth_timestamp=1636207991&oauth_nonce=ppeMVag1KFU&oauth_version=1.0&oauth_signature=PeengrT4Pq5FrSA6h5erxy"
  );
});

router.get("/callback/twitter", async (context: Context) => {
  const accessCode = helpers.getQuery(context).code;

  const data = new FormData();
  data.append("client_id", configs.oauth.github.clientId);
  data.append("client_secret", configs.oauth.github.clientSecret);
  data.append("grant_type", "authorization_code");
  data.append("redirect_uri", configs.oauth.github.redirectUri);
  data.append("scope", configs.oauth.discord.scopes.join(" "));
  data.append("code", accessCode);

  const gh = await fetch("https://github.com/login/oauth/access_token", {
    method: "POST",
    headers: {
      Accept: "application/json",
    },
    body: data,
  }).then((res) => res.json());

  context.response.body = { gh };
});

router.get("/callback/github", async (context: Context) => {
  if (context.state.user) return context.response.redirect("/");
  const accessCode = helpers.getQuery(context).code;

  if (!accessCode) {
    const error = helpers.getQuery(context).error;
    if (!error) throw new httpErrors.BadRequest(`no acces code from Github`);
    throw new httpErrors.BadRequest(error);
  }

  const data = new FormData();
  data.append("client_id", configs.oauth.github.clientId);
  data.append("client_secret", configs.oauth.github.clientSecret);
  data.append("grant_type", "authorization_code");
  data.append("redirect_uri", configs.oauth.github.redirectUri);
  data.append("scope", configs.oauth.discord.scopes.join(" "));
  data.append("code", accessCode);

  const gh = await fetch("https://github.com/login/oauth/access_token", {
    method: "POST",
    headers: {
      Accept: "application/json",
    },
    body: data,
  }).then((res) => res.json());

  context.response.body = { gh };
});
