module "get_bookclubs_lambda" {
  source = "../../modules/lambda_function"

  name = "get_bookclubs"
  filename = "${path.module}/../../../build/getBookclubs.zip"
  handler = "getBookClubs.handler"
  runtime = "python3.11"
  role_arn = var.lambda_role_arn
}

module "get_bookclub_lambda" {
  source = "../../modules/lambda_function"

  name = "get_bookclub"
  filename = "${path.module}/../../../build/getBookclub.zip"
  handler = "getBookClub.handler"
  runtime = "python3.11"
  role_arn = var.lambda_role_arn
}

module "create_bookclub_lambda" {
  source = "../../modules/lambda_function"

  name = "create_bookclub"
  filename = "${path.module}/../../../build/createBookclub.zip"
  handler = "createBookClub.handler"
  runtime = "python3.11"
  role_arn = var.lambda_role_arn
}

module "update_bookclub_lambda" {
  source = "../../modules/lambda_function"

  name = "update_bookclub"
  filename = "${path.module}/../../../build/updateBookclub.zip"
  handler = "updateBookClub.handler"
  runtime = "python3.11"
  role_arn = var.lambda_role_arn
}

module "delete_bookclub_lambda" {
  source = "../../modules/lambda_function"

  name = "delete_bookclub"
  filename = "${path.module}/../../../build/deleteBookclub.zip"
  handler = "deleteBookClub.handler"
  runtime = "python3.11"
  role_arn = var.lambda_role_arn
}