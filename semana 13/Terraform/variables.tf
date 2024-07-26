variable "aws_region" {
  description = "AWS region"
  default     = "us-east-2"
}

variable "lambda_function_name" {
  description = "Name of the Lambda function"
  default     = "MyLambdaFunction"
}

variable "role_name" {
  description = "Name of the IAM role"
  default     = "lambda-execute-role"
}

variable "handler" {
  description = "Lambda function handler"
  default     = "LambdaEntryPoint::LambdaEntryPoint.FunctionHandlerAsync"
}

variable "runtime" {
  description = "Lambda function runtime"
  default     = "dotnet8"
}

variable "zip_file" {
  description = "Path to the Lambda deployment package"
  default     = "./publish/function.zip"
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  default     = "MyApi"
}
