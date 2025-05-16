provider "aws" {
  region = "us-east-1"
}

module "api" {
  source = "./modules/api_gateway"
  name = "bookclub-api"
  environment = "dev"
  client_id           = module.cognito.client_id
  user_pool_endpoint  = module.cognito.user_pool_endpoint
}

resource "aws_iam_role" "lambda_exec" {
  name = "bookclub-lambda-exec"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action    = "sts:AssumeRole"
      Principal = { Service = "lambda.amazonaws.com" }
      Effect    = "Allow"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "basic_lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

module "bookshelf_service" {
  source          = "./services/bookshelf"
  api_id          = module.api.api_id
  execution_arn   = module.api.execution_arn
  lambda_role_arn = aws_iam_role.lambda_exec.arn
}

module "bookclub_service" {
  source          = "./services/bookclub"
  api_id          = module.api.api_id
  execution_arn   = module.api.execution_arn
  lambda_role_arn = aws_iam_role.lambda_exec.arn
}

module "cognito" {
  source = "./modules/cognito"
  name   = "bookclub"

  callback_urls = ["http://localhost:3000"]
  logout_urls   = ["http://localhost:3000/logout"]
}
