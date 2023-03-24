import express, { Express, json } from "express";
import cors from "cors";
import { loadEnv, connectDb, disconnectDB } from "@/config";

loadEnv();
const app = express();

app
  .use(json())
  .use(cors())
  .get("/health", (_req, res) => res.send("OK!"));

export function init(): Promise<Express> {
  connectDb();
  return Promise.resolve(app);
}

export async function close(): Promise<void> {
  await disconnectDB();
}

export default app;
