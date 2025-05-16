module "get_bookshelf_route" {
  source         = "../../modules/apigw_route"
  api_id         = var.api_id
  execution_arn  = var.execution_arn
  route_key      = "GET /bookshelf"
  lambda_arn     = module.get_bookshelf_lambda.lambda_arn
  lambda_name    = module.get_bookshelf_lambda.lambda_name
}

module "add_bookshelf_route" {
  source         = "../../modules/apigw_route"
  api_id         = var.api_id
  execution_arn  = var.execution_arn
  route_key      = "POST /bookshelf"
  lambda_arn     = module.add_bookshelf_lambda.lambda_arn
  lambda_name    = module.add_bookshelf_lambda.lambda_name
}

module "remove_bookshelf_route" {
  source         = "../../modules/apigw_route"
  api_id         = var.api_id
  execution_arn  = var.execution_arn
  route_key      = "DELETE /bookshelf/{id}"
  lambda_arn     = module.remove_bookshelf_lambda.lambda_arn
  lambda_name    = module.remove_bookshelf_lambda.lambda_name
}

module "update_bookshelf_route" {
  source         = "../../modules/apigw_route"
  api_id         = var.api_id
  execution_arn  = var.execution_arn
  route_key      = "PATCH /bookshelf/{id}"
  lambda_arn     = module.update_bookshelf_lambda.lambda_arn
  lambda_name    = module.update_bookshelf_lambda.lambda_name
}