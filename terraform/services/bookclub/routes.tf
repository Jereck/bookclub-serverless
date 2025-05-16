module "get_bookclubs_route" {
  source = "../../modules/apigw_route"
  api_id = var.api_id
  execution_arn = var.execution_arn
  route_key = "GET /bookclubs"
  lambda_arn = module.get_bookclubs_lambda.lambda_arn
  lambda_name = module.get_bookclubs_lambda.lambda_name
}

module "get_bookclub_route" {
  source = "../../modules/apigw_route"
  api_id = var.api_id
  execution_arn = var.execution_arn
  route_key = "GET /bookclubs/{id}"
  lambda_arn = module.get_bookclub_lambda.lambda_arn
  lambda_name = module.get_bookclub_lambda.lambda_name
}

module "create_bookclub_route" {
  source = "../../modules/apigw_route"
  api_id = var.api_id
  execution_arn = var.execution_arn
  route_key = "POST /bookclubs"
  lambda_arn = module.create_bookclub_lambda.lambda_arn
  lambda_name = module.create_bookclub_lambda.lambda_name
}

module "update_bookclub_route" {
  source = "../../modules/apigw_route"
  api_id = var.api_id
  execution_arn = var.execution_arn
  route_key = "PATCH /bookclubs/{id}"
  lambda_arn = module.update_bookclub_lambda.lambda_arn
  lambda_name = module.update_bookclub_lambda.lambda_name
}

module "delete_bookclub_route" {
  source = "../../modules/apigw_route"
  api_id = var.api_id
  execution_arn = var.execution_arn
  route_key = "DELETE /bookclubs/{id}"
  lambda_arn = module.delete_bookclub_lambda.lambda_arn
  lambda_name = module.delete_bookclub_lambda.lambda_name
}