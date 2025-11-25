variable "region" {
  type = string
  default = "us-west-1"
}

variable "url_table" {
  type = string
  description = "Tabla de DynamoDB"
  default = "sortener-urls"
}

variable "lambda_s3_key" {
  type = string
  description = "Ruta para el ZIP que subira por CI/CD"
  default = "lambda.zip"
}

variable "base_url" {
  type = string
  description = "Dominio del shortener"
}