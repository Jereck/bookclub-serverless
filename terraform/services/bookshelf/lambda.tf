module "get_bookshelf_lambda" {
  source     = "../../modules/lambda_function"

  name       = "get_bookshelf"
  filename   = "${path.module}/../../../build/getBookshelf.zip"
  handler    = "getBookshelf.handler"
  runtime    = "python3.11"
  role_arn   = var.lambda_role_arn
}

module "add_bookshelf_lambda" {
  source     = "../../modules/lambda_function"

  name       = "add_bookshelf"
  filename   = "${path.module}/../../../build/addBookToShelf.zip"
  handler    = "addBookToShelf.handler"
  runtime    = "python3.11"
  role_arn   = var.lambda_role_arn
}

module "remove_bookshelf_lambda" {
  source     = "../../modules/lambda_function"

  name       = "remove_bookshelf"
  filename   = "${path.module}/../../../build/removeBookFromShelf.zip"
  handler    = "removeBookFromShelf.handler"
  runtime    = "python3.11"
  role_arn   = var.lambda_role_arn
}

module "update_bookshelf_lambda" {
  source     = "../../modules/lambda_function"

  name       = "update_bookshelf"
  filename   = "${path.module}/../../../build/updateBookOnShelf.zip"
  handler    = "updateBookOnShelf.handler"
  runtime    = "python3.11"
  role_arn   = var.lambda_role_arn
}