output "api_id" {
  value = aws_apigatewayv2_api.this.id
}

output "execution_arn" {
  value = aws_apigatewayv2_api.this.execution_arn
}

output "api_endpoint" {
  value = aws_apigatewayv2_api.this.api_endpoint
}

output "authorizer_id" {
  value = aws_apigatewayv2_authorizer.cognito.id
}
