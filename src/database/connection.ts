import { PostgreSQLClientOptions, Pool } from "../../deps.ts";
import configs from "../../configs.ts";

export const pool = new Pool(
  {
    database: configs.database.database,
    hostname: configs.database.host,
    port: configs.database.port,
    user: configs.database.user,
    password: configs.database.password,
  },
  20,
  true
);

export const connectionOptions: PostgreSQLClientOptions = {
  database: configs.database.database,
  hostname: configs.database.host,
  port: configs.database.port,
  user: configs.database.user,
  password: configs.database.password,
};

export default pool;
