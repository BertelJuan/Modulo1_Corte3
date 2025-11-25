resource "aws_s3_bucket" "lambda_bucket" {
  bucket = var.lambda_s3_bucket
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "lambda_versioning" {
  bucket = aws_s3_bucket.lambda_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_object" "lambda_zip" {
  bucket = aws_s3_bucket.lambda_bucket.bucket
  key    = var.lambda_s3_key
  source = null
}
