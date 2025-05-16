resource "aws_apigatewayv2_api" "this" {
  name          = "${var.name}-api"
  protocol_type = "HTTP"

  cors_configuration {
    allow_methods = ["GET", "POST", "PUT", "DELETE", "OPTIONS"]
    allow_origins = ["*"]  # Replace with frontend origin later
    allow_headers = ["*"]
    expose_headers = ["*"]
  }

  tags = {
    Project     = var.name
    Environment = var.environment
  }
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.this.id
  name        = "$default"
  auto_deploy = true

  tags = {
    Project     = var.name
    Environment = var.environment
  }
}

resource "aws_apigatewayv2_authorizer" "cognito" {
  name           = "${var.name}-authorizer"
  api_id         = aws_apigatewayv2_api.this.id
  authorizer_type = "JWT"
  identity_sources = ["$request.header.Authorization"]

  jwt_configuration {
    audience = [var.client_id]
    issuer   = "https://${var.user_pool_endpoint}"
  }
}
