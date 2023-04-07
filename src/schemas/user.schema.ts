import { CreateUserParams } from "@/utils/protocols";
import Joi from "joi";


export const userSchema = Joi.object <CreateUserParams> ({
    first_name: Joi.string().required(),
    second_name: Joi.string().required(),
    email: Joi.string().email().required(),
    mobile: Joi.string().pattern(/^[0-9]+$/).min(10).max(14).required(),
    password: Joi.string().required(),
    picture_url: Joi.string().uri().required(),
})