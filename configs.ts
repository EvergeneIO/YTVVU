export const configs = {
  general: {
    port: 3000,
    hostname: "localhost",
    env: "dev",
  },
  database: {
    host: "localhost",
    port: 5432,
    user: "dbtech",
    password: "dbtech",
    database: "dbtech",
    redis: {
      hostname: "localhost",
      port: 6379,
    },
  },
  fernet: {
    client: {
      secret: "Gbjgey3y7DMWxIS9Cn57oy3IirVCFgPrKN1O4WxbOnE=",
      live: 604800000,
    },
    application: {
      secret: "yhgtanmeNkl8biWrKqkCI8FrbN2ZpIKWX2yz_KCp3T8=",
    },
    bearer: {
      secret: "ctVPc5jAs9HKy_ADytep_G_nEUaC4x4jLb3veMmdqmU=",
      live: 604800000,
    },
  },
  captcha: {
    secret: "0xD639d5350830189036A084Cb23A1E4A8128C07b5",
    siteKey: "0d3ed5c8-da4a-4b1f-946e-d34acc5ad477",
  },
  oauth: {
    discord: {
      clientId: "890007205200408607",
      clientSecret: "DkVOuX8GUI6KicjcfdaduANhjBZZRliB",
      scopes: ["identify", "email", "guilds.join"],
      redirectUri: "http://localhost/auth/callback/discord",
    },
    github: {
      clientId: "7faaab5a9ee93540d9ba",
      clientSecret: "f91e91dccba65799d6c5f05cd677835faa71e1d5",
      scopes: ["read:user", "user:email"],
      redirectUri: "http://localhost/auth/callback/github",
    },
    twitter: {
      clientId: "HsD1GpoybYPlrAWhFvaQ5E53w",
      clientSecret: "SlOewknLGUCe9SkSvC7uRgcjTWUChGt07fFYj9GA3heAplQJMW",
      scopes: ["read:user", "user:email"],
      redirectUri: "http://localhost/auth/callback/github",
    },
    twitch: {
      clientId: "3i9agy5kb7xeip7l39cny1owv96jeu",
      clientSecret: "D6hNdco58l38pHn6I9fAuUx259fTsJrjArxZsO83H3U=",
      scopes: ["read:user", "user:email"],
      redirectUri: "http://localhost/auth/callback/github",
    },
  },
  discord: {
    bot: "ODkwMDA3MjA1MjAwNDA4NjA3.YUphzQ.OEfdQnyeTCp_xMcAYzIWM3uklTg",
    server: "861608165304958995",
  },
  mail: {
    server: "mail.evergene.io",
    port: 465,
    username: "noreply@vetault.com",
    password: "5JrbrzQ8*KiE!FCnx9VvM#4S^Kf@Z$4^4qAuxUz&NBRccAY9jkY2HqFudof8^kp",
  },
};
export default configs;
