resource "aws_lambda_function" "shorten" {
  function_name = "shortener-lambda"
  role = aws_iam_role.lambda_role.arn
  handler = "handler.handler"
  runtime = "nodejs18.x"

  memory_size = 256
  timeout = 10

  environment {
    variables = {
     TABLE_NAME = var.url_table
     BASE_URL = var.base_url 
    }
  }

  s3_bucket = var.lambda_s3_bucket
  s3_key = var.lambda_s3_key

  depends_on = [ aws_iam_role.lambda_role, aws_iam_role_policy.lambda_policy ]
}
