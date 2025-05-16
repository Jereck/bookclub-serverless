resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "lambda_policy" {
  name       = "lambda_policy"
  roles      = [aws_iam_role.lambda_exec.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "get_bookshelf" {
  function_name = "get_bookshelf"
  runtime = "python3.11"
  role = aws_iam_role.lambda_exec.arn
  handler = "getBookshelf.handler"
  filename = "${path.module}/../build/getBookshelf.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/getBookshelf.zip")
}

resource "aws_lambda_function" "add_book_to_shelf" {
  function_name = "add_book_to_shelf"
  runtime = "python3.11"
  role = aws_iam_role.lambda_exec.arn
  handler = "addBookToShelf.handler"
  filename = "${path.module}/../build/addBookToShelf.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/addBookToShelf.zip")
}

resource "aws_lambda_function" "remove_book_from_shelf" {
  function_name = "remove_book_from_shelf"
  runtime = "python3.11"
  role = aws_iam_role.lambda_exec.arn
  handler = "removeBookFromShelf.handler"
  filename = "${path.module}/../build/removeBookFromShelf.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/removeBookFromShelf.zip")
}

resource "aws_lambda_function" "update_book_on_shelf" {
  function_name = "update_book_on_shelf"
  runtime = "python3.11"
  role = aws_iam_role.lambda_exec.arn
  handler = "updateBookOnShelf.handler"
  filename = "${path.module}/../build/updateBookOnShelf.zip"
  source_code_hash = filebase64sha256("${path.module}/../build/updateBookOnShelf.zip")
}