resource "aws_dynamodb_table" "urls" {
  name = var.url_table
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "code"

  attribute {
    name = "code"
    type = "S"
  }

  tags = {
    Module = "Shortener"
  }
}