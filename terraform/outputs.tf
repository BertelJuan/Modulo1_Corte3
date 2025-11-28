output "api_url" {
  value = aws_api_gateway_deployment.deploy.invoke_url
}

output "lambda_arn" {
  value = aws_lambda_function.shorten.arn
}


output "table_name" {
  value = var.url_table
}

# outputs.tf del Módulo 1
output "api_id" {
  value = aws_api_gateway_rest_api.api.id
}

output "root_id" {
  value = aws_api_gateway_rest_api.api.root_resource_id
}

output "execution_arn" {
  value = aws_api_gateway_rest_api.api.execution_arn
}