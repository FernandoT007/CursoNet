output "lambda_function_name" {
  value = aws_lambda_function.lambda.function_name
}

output "api_endpoint" {
  value = aws_apigatewayv2_stage.api_stage.invoke_url
}
