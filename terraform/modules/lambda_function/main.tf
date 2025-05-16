resource "aws_lambda_function" "this" {
  function_name = var.name
  filename      = var.filename
  handler       = var.handler
  runtime       = var.runtime
  role          = var.role_arn

  source_code_hash = filebase64sha256(var.filename)

  timeout     = 10
  memory_size = 128
}

output "lambda_name" {
  value = aws_lambda_function.this.function_name
}

output "lambda_arn" {
  value = aws_lambda_function.this.invoke_arn
}
