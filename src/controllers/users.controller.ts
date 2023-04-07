import { CreateUserParams } from "@/utils/protocols";
import { Request, Response } from "express";
import httpStatus from "http-status";

export async function postUser(req: Request, res: Response) {
  const { first_name, second_name, email, mobile, password, picture_url } = req.body;
  try {
    return res.status(httpStatus.CREATED).send(`User registered successfully! Welcome, ${first_name}!`);
  } catch (error) {
    if (error.name === "DuplicatedEmailError") {
      return res.status(httpStatus.CONFLICT).send(error);
    }
    return res.status(httpStatus.BAD_REQUEST).send(error);
  }
}
