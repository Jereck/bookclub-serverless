resource "aws_apigatewayv2_api" "bookclub_api" {
  name = "bookclub-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_methods = ["GET", "POST", "PUT", "DELETE"]
    allow_origins = ["*"]
    allow_headers = ["*"]
    expose_headers = ["*"]
  }

  tags = {
    Name        = "bookclub"
    Environment = "dev"
  }
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.bookclub_api.id
  name        = "$default"
  auto_deploy = true

  tags = {
    Environment = "dev"
    Project     = "bookclub"
  }
}

/*
* ====== ROUTES  ======
* - Route
* - Integration
* - Invokation
* =====================
*/

// GET /bookshelf
resource "aws_apigatewayv2_route" "get_bookshelf_route" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  route_key = "GET /bookshelf"
  target = "integrations/${aws_apigatewayv2_integration.get_bookshelf_integration.id}"
  // add authorizor
  // add auth type
}

resource "aws_apigatewayv2_integration" "get_bookshelf_integration" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.get_bookshelf.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "apigw_invoke_get" {
  statement_id = "AllowAPIGWInvokeGet"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.get_bookshelf.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.bookclub_api.execution_arn}/*/*"
}

// POST /bookshelf
resource "aws_apigatewayv2_route" "add_bookshelf_route" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  route_key = "POST /bookshelf"
  target = "integrations/${aws_apigatewayv2_integration.add_bookshelf_integration.id}"
  // add authorizor
  // add auth type
}

resource "aws_apigatewayv2_integration" "add_bookshelf_integration" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.add_book_to_shelf.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "apigw_invoke_create" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.add_book_to_shelf.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.bookclub_api.execution_arn}/*/*"
}

// PATCH /bookshelf/{id}
resource "aws_apigatewayv2_route" "update_bookshelf_route" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  route_key = "PATCH /bookshelf/{id}"
  target = "integrations/${aws_apigatewayv2_integration.update_bookshelf_integration.id}"
  // add authorizor
  // add auth type
}

resource "aws_apigatewayv2_integration" "update_bookshelf_integration" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.update_book_on_shelf.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "apigw_invoke_update" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.update_book_on_shelf.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.bookclub_api.execution_arn}/*/*"
}

// DELETE /bookshelf/{id}
resource "aws_apigatewayv2_route" "remove_bookshelf_route" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  route_key = "DELETE /bookshelf/{id}"
  target = "integrations/${aws_apigatewayv2_integration.remove_bookshelf_integration.id}"
  // add authorizor
  // add auth type
}

resource "aws_apigatewayv2_integration" "remove_bookshelf_integration" {
  api_id = aws_apigatewayv2_api.bookclub_api.id
  integration_type = "AWS_PROXY"
  integration_uri = aws_lambda_function.remove_book_from_shelf.invoke_arn
  integration_method = "POST"
  payload_format_version = "2.0"
}

resource "aws_lambda_permission" "apigw_invoke_delete" {
  statement_id = "AllowExecutionFromAPIGateway"
  action = "lambda:InvokeFunction"
  function_name = aws_lambda_function.remove_book_from_shelf.function_name
  principal = "apigateway.amazonaws.com"
  source_arn = "${aws_apigatewayv2_api.bookclub_api.execution_arn}/*/*"
}