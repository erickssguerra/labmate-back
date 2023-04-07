import { Router } from "express";
import { userSchema } from "@/schemas";
import { validateBody } from "@/middlewares";
import { postUser } from "@/controllers";

const userRouter = Router();

userRouter.post("/", validateBody(userSchema), postUser);

export { userRouter };
