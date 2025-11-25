resource "aws_lambda_function" "shorten" {
  function_name = "shortener-lambda-v2"
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

  s3_bucket = aws_s3_bucket.lambda_bucket.bucket
  s3_key = aws_s3_object.lambda_zip.key

  depends_on = [ 
    aws_iam_role.lambda_role, 
    aws_iam_role_policy.lambda_policy,
    aws_s3_object.lambda_zip
  ]
}
