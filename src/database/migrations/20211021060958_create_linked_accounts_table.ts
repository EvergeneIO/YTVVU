import { AbstractMigration, ClientPostgreSQL } from "../../../deps.ts";
import { runQuery } from "../database.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await runQuery(`
    create table "linkedAccounts"
    (
        "userId"       bigint not null,
        provider       text   not null,
        email          text   not null,
        "accessToken"  text   not null,
        "refreshToken" text   not null,
        constraint linkedaccounts_pk_2
            primary key (provider, email)
    );
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await runQuery(`drop table linkedAccounts`);
  }
}
