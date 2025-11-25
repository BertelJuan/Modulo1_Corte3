output "api_url" {
    value = "${aws_api_gateway_deployment.deploy.invoke_url}"
}

output "lambda_arn" {
    value = "aws_lambda_function.shorten.arn"
}

output "table_name" {
    value =  "var.table_name"
}