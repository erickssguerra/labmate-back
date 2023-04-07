export type CreateUserParams = {
  first_name: string;
  second_name: string;
  email: string;
  mobile: string;
  password: string;
  picture_url: string;
  created_at: Date;
};

export type ApplicationError = {
    name: string;
    message: string;
  };