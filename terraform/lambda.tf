resource "aws_lambda_function" "shorten" {
  function_name = "shortener-lambda-v2"
  role = aws_iam_role.lambda_role.arn
  handler = "src/handler.handler"
  runtime = "nodejs18.x"

  memory_size = 256
  timeout = 10

  environment {
    variables = {
     TABLE_NAME = var.url_table
     BASE_URL = var.base_url 
    }
  }

  filename         = "${path.module}/../lambda.zip"
  source_code_hash = filebase64sha256("${path.module}/../lambda.zip")

  depends_on = [ 
    aws_iam_role.lambda_role, 
    aws_iam_role_policy.lambda_policy    
  ]
}
