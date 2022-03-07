import configs from "../../configs.ts";
import { Router } from "../../deps.ts";
import db from "../database/database.ts";
import { sendEta } from "../helpers/send_eta.ts";
import { RateLimiter, userGuard } from "../middlewares/middlewares.ts";
import { Context, PlayList } from "../types/mod.ts";
import { logger } from "../utils/mod.ts";

export const router = new Router();
const r = RateLimiter({
  max: 1,
});
//ratelimit(600, 10)
router.get(
  "/",
  /* RateLimiter(), */ async (context: Context) => {
    await sendEta(context, "index", { user: context.state.user, page: { title: "Home" } });
  }
);

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

router.get("/dashboard", userGuard(["Client"], "USER", "ADMIN"), async (context: Context) => {
  const channels = await db
    .select(db.channels.channelId, db.channels.name, db.channels.profilePicture, db.channels.banner)
    .from(db.channels)
    .where(db.channels.userId.eq(context.state.user!.id));

  await sendEta(context, "dashboard", {
    page: { title: "Dashboard" },
    channels,
  });
});

//GET https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails%2Cid%2Csnippet%2Cstatus&id=cbd&maxResults=10&playlistId=abc HTTP/1.1

router.get("/dashboard/c/:c", userGuard(["Client"], "USER"), async (context: Context) => {
  const c = context.request.url.pathname.split("/")[3];

  const [{ accessToken, uploads }] = await db
    .select(db.channels.accessToken, db.channels.uploads)
    .from(db.channels)
    .where(db.channels.channelId.eq(c));

  const videos: PlayList = {
    kind: "youtube#playlistItemListResponse",
    etag: "P8m1yd8NbQU1D9ASao_ospnhIUs",
    nextPageToken: "EAAaBlBUOkNBbw",
    items: [
      {
        kind: "youtube#playlistItem",
        etag: "ryrRX1Vd2z-2jIbenP98fQ9KLIk",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLlFfd3hnV3hpSzBz",
        snippet: {
          publishedAt: "2021-12-08T19:04:04Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "TFT Veigar Level 3",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/Q_wxgWxiK0s/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/Q_wxgWxiK0s/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/Q_wxgWxiK0s/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/Q_wxgWxiK0s/sddefault.jpg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i.ytimg.com/vi/Q_wxgWxiK0s/maxresdefault.jpg",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 0,
          resourceId: {
            kind: "youtube#video",
            videoId: "Q_wxgWxiK0s",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "Q_wxgWxiK0s",
          videoPublishedAt: "2021-12-08T19:04:04Z",
        },
        status: {
          privacyStatus: "unlisted",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "Uq1L2lSiAx6TSdN12kwICyuEP5k",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLlhudUJDcVNpQkpj",
        snippet: {
          publishedAt: "2021-11-11T16:30:44Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Video2",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/XnuBCqSiBJc/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/XnuBCqSiBJc/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/XnuBCqSiBJc/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/XnuBCqSiBJc/sddefault.jpg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i.ytimg.com/vi/XnuBCqSiBJc/maxresdefault.jpg",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 1,
          resourceId: {
            kind: "youtube#video",
            videoId: "XnuBCqSiBJc",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "XnuBCqSiBJc",
          videoPublishedAt: "2021-11-11T16:30:44Z",
        },
        status: {
          privacyStatus: "public",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "Exi6bbOoQs4QPIw0fTljOAj8DLk",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLllGbW1PR19ZNGJ3",
        snippet: {
          publishedAt: "2021-08-28T12:50:39Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Left 4 Dead 2 2021 05 12   21 21 25 02 DVR",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/YFmmOG_Y4bw/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/YFmmOG_Y4bw/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/YFmmOG_Y4bw/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/YFmmOG_Y4bw/sddefault.jpg",
              width: 640,
              height: 480,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 2,
          resourceId: {
            kind: "youtube#video",
            videoId: "YFmmOG_Y4bw",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "YFmmOG_Y4bw",
          videoPublishedAt: "2021-08-28T12:50:39Z",
        },
        status: {
          privacyStatus: "unlisted",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "x0tiANB6fsVrK7BxYo1_PTxDnVU",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLml6SHBIZmRFUmln",
        snippet: {
          publishedAt: "2021-07-22T20:33:19Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Streamtape com",
          description: "",
          thumbnails: {
            default: {
              url: "https://i9.ytimg.com/vi/izHpHfdERig/default.jpg?sqp=CPSPgI4G&rs=AOn4CLA_x7XjU3fKDzIzdlN_UdYwSTGgPg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i9.ytimg.com/vi/izHpHfdERig/mqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLC74uXTfvS5kc4sCKoxwqLHF-wntA",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i9.ytimg.com/vi/izHpHfdERig/hqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLDN6wmPmjJ0cclZKXeGZU_naWuXJA",
              width: 480,
              height: 360,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 3,
          resourceId: {
            kind: "youtube#video",
            videoId: "izHpHfdERig",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "izHpHfdERig",
          videoPublishedAt: "2021-07-22T20:33:19Z",
        },
        status: {
          privacyStatus: "private",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "zFqlh9XttUC4iOQVxN3AQxwzL7Q",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLmVZWDJhQVlMeG9Z",
        snippet: {
          publishedAt: "2020-11-12T16:37:38Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Luck",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/eYX2aAYLxoY/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/eYX2aAYLxoY/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/eYX2aAYLxoY/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/eYX2aAYLxoY/sddefault.jpg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i.ytimg.com/vi/eYX2aAYLxoY/maxresdefault.jpg",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 4,
          resourceId: {
            kind: "youtube#video",
            videoId: "eYX2aAYLxoY",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "eYX2aAYLxoY",
          videoPublishedAt: "2020-11-12T16:37:38Z",
        },
        status: {
          privacyStatus: "public",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "zDgdxia3Gw9CI6VIxnTUNrL4WNI",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLjNDMEJmYUF4RnFr",
        snippet: {
          publishedAt: "2020-11-11T13:26:18Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "AoC und Plant spots Erklärung v1",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/3C0BfaAxFqk/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/3C0BfaAxFqk/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/3C0BfaAxFqk/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/3C0BfaAxFqk/sddefault.jpg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i.ytimg.com/vi/3C0BfaAxFqk/maxresdefault.jpg",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 5,
          resourceId: {
            kind: "youtube#video",
            videoId: "3C0BfaAxFqk",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "3C0BfaAxFqk",
          videoPublishedAt: "2020-11-11T13:26:18Z",
        },
        status: {
          privacyStatus: "unlisted",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "BvyR2ilcP_fC98dJq1SRwDbWsVU",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLl9zaG5EV0JhaHNR",
        snippet: {
          publishedAt: "2020-11-08T17:06:16Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "OwO",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/_shnDWBahsQ/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/_shnDWBahsQ/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/_shnDWBahsQ/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/_shnDWBahsQ/sddefault.jpg",
              width: 640,
              height: 480,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 6,
          resourceId: {
            kind: "youtube#video",
            videoId: "_shnDWBahsQ",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "_shnDWBahsQ",
          videoPublishedAt: "2020-11-08T17:06:16Z",
        },
        status: {
          privacyStatus: "public",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "OJ0VQbM6nBIEHY2pHim4cz8cDhU",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLnVrQ2wwZ1M2bUtR",
        snippet: {
          publishedAt: "2020-10-30T04:18:03Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "BEST OF RAZE {VALORANT} [IRON HEART FOR EVER] (RAZE AND OPERATOR MAIN)",
          description: "",
          thumbnails: {
            default: {
              url: "https://i.ytimg.com/vi/ukCl0gS6mKQ/default.jpg",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i.ytimg.com/vi/ukCl0gS6mKQ/mqdefault.jpg",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i.ytimg.com/vi/ukCl0gS6mKQ/hqdefault.jpg",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i.ytimg.com/vi/ukCl0gS6mKQ/sddefault.jpg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i.ytimg.com/vi/ukCl0gS6mKQ/maxresdefault.jpg",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 7,
          resourceId: {
            kind: "youtube#video",
            videoId: "ukCl0gS6mKQ",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "ukCl0gS6mKQ",
          videoPublishedAt: "2020-10-30T04:18:03Z",
        },
        status: {
          privacyStatus: "public",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "P4_oZsYNYKZoapmbVF64lZVhH9Y",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLlVpbzJSbWxQR0NF",
        snippet: {
          publishedAt: "2020-10-30T04:15:26Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Just an Ace",
          description: "",
          thumbnails: {
            default: {
              url: "https://i9.ytimg.com/vi/Uio2RmlPGCE/default.jpg?sqp=CPSPgI4G&rs=AOn4CLCiYRG7Vzy6MPIhUsaTpNsPZvju1A",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i9.ytimg.com/vi/Uio2RmlPGCE/mqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLCimLcO8Zzv_INmpx9xpDefnJgo9A",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i9.ytimg.com/vi/Uio2RmlPGCE/hqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLDh1TkfnLQQkAKQZXYgYpyjYZ0d1Q",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i9.ytimg.com/vi/Uio2RmlPGCE/sddefault.jpg?sqp=CPSPgI4G&rs=AOn4CLANS5u1Qug6XTkmGNlprtRDRfP-wg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i9.ytimg.com/vi/Uio2RmlPGCE/maxresdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLCIWXI-6VSQxCuzPWGeWUyzPaBJuQ",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 8,
          resourceId: {
            kind: "youtube#video",
            videoId: "Uio2RmlPGCE",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "Uio2RmlPGCE",
          videoPublishedAt: "2020-10-30T04:15:26Z",
        },
        status: {
          privacyStatus: "private",
        },
      },
      {
        kind: "youtube#playlistItem",
        etag: "eZwStxNvFekLsVwGQWI5ZPSQous",
        id: "VVU2VFA3VklFbmV2NVpsNGNxVlRCODRBLm45VjBBSDZXQ0JJ",
        snippet: {
          publishedAt: "2020-10-30T02:09:24Z",
          channelId: "UC6TP7VIEnev5Zl4cqVTB84A",
          title: "Valorant 2020 10 30   03 02 51 02 DVR",
          description: "",
          thumbnails: {
            default: {
              url: "https://i9.ytimg.com/vi/n9V0AH6WCBI/default.jpg?sqp=CPSPgI4G&rs=AOn4CLBBJOnzXMlKGoxzzH5kvoy52xLPEw",
              width: 120,
              height: 90,
            },
            medium: {
              url: "https://i9.ytimg.com/vi/n9V0AH6WCBI/mqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLC6_uapHVx1Wf7Kx3me1s2v0AzfkA",
              width: 320,
              height: 180,
            },
            high: {
              url: "https://i9.ytimg.com/vi/n9V0AH6WCBI/hqdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLDLDM2NRAFzTAljPLakKlug2MfAoQ",
              width: 480,
              height: 360,
            },
            standard: {
              url: "https://i9.ytimg.com/vi/n9V0AH6WCBI/sddefault.jpg?sqp=CPSPgI4G&rs=AOn4CLDhifuZUivY2JzT2uB-9iFr6u7-tg",
              width: 640,
              height: 480,
            },
            maxres: {
              url: "https://i9.ytimg.com/vi/n9V0AH6WCBI/maxresdefault.jpg?sqp=CPSPgI4G&rs=AOn4CLBi3BBdxQk6LfxLm1bfa831CnNYaA",
              width: 1280,
              height: 720,
            },
          },
          channelTitle: "Newt",
          playlistId: "UU6TP7VIEnev5Zl4cqVTB84A",
          position: 9,
          resourceId: {
            kind: "youtube#video",
            videoId: "n9V0AH6WCBI",
          },
          videoOwnerChannelTitle: "Newt",
          videoOwnerChannelId: "UC6TP7VIEnev5Zl4cqVTB84A",
        },
        contentDetails: {
          videoId: "n9V0AH6WCBI",
          videoPublishedAt: "2020-10-30T02:09:24Z",
        },
        status: {
          privacyStatus: "private",
        },
      },
    ],
    pageInfo: {
      totalResults: 15,
      resultsPerPage: 10,
    },
  };

  /*   await fetch(
    `https://youtube.googleapis.com/youtube/v3/playlistItems?part=contentDetails%2Cid%2Csnippet%2Cstatus&maxResults=10&playlistId=${uploads}`,
    {
      method: "GET",
      headers: {
        "Content-Type": "application/json",
        Authorization: `Bearer ${accessToken}`,
      },
    }
  ).then((res) => res.json()); */

  const [channel] = await db
    .select(db.channels.channelId, db.channels.name, db.channels.profilePicture, db.channels.banner)
    .from(db.channels)
    .where(db.channels.channelId.eq(c));

  logger.info("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: ", videos);

  await sendEta(context, "[channel]", {
    page: { title: `Dashboard ${channel.name}` },
    channel,
    videos: videos.items,
  });
});

export default router;
