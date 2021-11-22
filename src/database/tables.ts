import { mammoth } from "../../deps.ts";

export const groups = mammoth.defineTable({
  name: mammoth.text().primaryKey(),
  permissions: mammoth.bigint().notNull(),
});

export const linkedAccounts = mammoth.defineTable({
  userId: mammoth.bigint().primaryKey(),
  provider: mammoth.text().primaryKey().unique(),
  email: mammoth.text().unique().notNull(),
  accessToken: mammoth.text().notNull(),
  refreshToken: mammoth.text().notNull(),
});

export const sessions = mammoth.defineTable({
  userId: mammoth.bigint().primaryKey(),
  sessionId: mammoth.text().primaryKey(),
  exp: mammoth.bigint().notNull(),
});

export const settings = mammoth.defineTable({
  id: mammoth.bigint().unique().notNull(),
  notify: mammoth.bool().default("true"),
  emailverify: mammoth.bool().default("false"),
});

export const users = mammoth.defineTable({
  id: mammoth.bigint().unique().notNull(),
  username: mammoth.text().unique().notNull(),
  email: mammoth.text().unique().notNull(),
  password: mammoth.text(),
  avatarUrl: mammoth.text().notNull(),
  permissions: mammoth.bigint().notNull().default("1"),
  groups: mammoth.array(mammoth.text()).notNull().default("ARRAY['USER']::TEXT[]"),
});
