import express, { Express, json } from "express";
import cors from "cors";
import { loadEnv, connectDb, disconnectDB } from "@/config";
import { userRouter } from "@/routers";

loadEnv();
const app = express();

app
  .use(json())
  .use(cors())
  .get("/health", (_req, res) => res.send("OK!"))
  .use("/sign-up", userRouter);

export function init(): Promise<Express> {
  connectDb();
  return Promise.resolve(app);
}

export async function close(): Promise<void> {
  await disconnectDB();
}

export default app;
