# Define el proveedor AWS y la región en la que se desplegarán los recursos.
provider "aws" {
  region = var.aws_region  # La región de AWS donde se desplegarán los recursos, especificada como una variable.
}

# Crea un rol de IAM que permitirá a Lambda ejecutar funciones con los permisos adecuados.
resource "aws_iam_role" "lambda_exec_role" {
  name = var.role_name  # Nombre del rol, especificado como una variable.

  # Política de asunción del rol, que define quién puede asumir este rol.
  assume_role_policy = jsonencode({
    Version = "2012-10-17",  # Versión del documento de política.
    Statement = [
      {
        Effect = "Allow",  # Permite la acción especificada.
        Principal = {
          Service = "lambda.amazonaws.com"  # El servicio Lambda asumirá este rol.
        },
        Action = "sts:AssumeRole"  # Permite a Lambda asumir este rol.
      }
    ]
  })
}

# Adjunta una política de IAM al rol creado anteriormente. Esta política da permisos básicos a Lambda.
resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec_role.name  # Nombre del rol al que se adjunta la política.
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"  # ARN de la política de ejecución básica de Lambda.
}

# Define la función Lambda, incluyendo su configuración y el código fuente.
resource "aws_lambda_function" "lambda" {
  function_name = var.lambda_function_name  # Nombre de la función Lambda, especificado como una variable.
  role          = aws_iam_role.lambda_exec_role.arn  # ARN del rol de ejecución Lambda.
  handler       = var.handler  # El manejador de la función Lambda, especificado como una variable (ej. "index.handler").
  runtime       = var.runtime  # El entorno de ejecución de Lambda (ej. "python3.8", "nodejs14.x").
  filename      = var.zip_file  # Ruta al archivo ZIP que contiene el código de la función.
  source_code_hash = filebase64sha256(var.zip_file)  # Hash del código fuente para verificar cambios.

  # Variables de entorno para la función Lambda.
  environment {
    variables = {
      ConnectionStrings__Database = "Host=xxxxx;Port=5432;Database=xxxx;Username=xxx;Password=xxxxx;"  # Cadena de conexión a la base de datos.
      JwtSettings__key            = "ThisIsAProperlySizedKeyWithAtLeast32Characters1234567890abcdef"  # Clave JWT para autenticación.
    }
  }
}

# Crea una API HTTP en API Gateway.
resource "aws_apigatewayv2_api" "api_gateway" {
  name          = var.api_gateway_name  # Nombre de la API, especificado como una variable.
  protocol_type = "HTTP"  # Tipo de protocolo para la API (HTTP en este caso).
}

# Configura la integración entre la API Gateway y la función Lambda.
resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id             = aws_apigatewayv2_api.api_gateway.id  # ID de la API Gateway que se integrará.
  integration_type   = "AWS_PROXY"  # Tipo de integración (AWS_PROXY permite el uso de la función Lambda como proxy).
  integration_uri    = aws_lambda_function.lambda.invoke_arn  # ARN de invocación de la función Lambda.
  integration_method = "POST"  # Método HTTP usado para invocar la función Lambda.
  payload_format_version = "2.0"  # Versión del formato de carga útil (2.0 es compatible con las API Gateway HTTP).
}

# Define una ruta en la API Gateway que mapea todas las solicitudes a la función Lambda.
resource "aws_apigatewayv2_route" "lambda_route" {
  api_id    = aws_apigatewayv2_api.api_gateway.id  # ID de la API Gateway a la que se añadirá la ruta.
  route_key = "ANY /{proxy+}"  # Ruta que captura cualquier solicitud HTTP y la pasa a la función Lambda.
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"  # Objetivo de la ruta, que es la integración con Lambda.
}

# Crea un escenario en la API Gateway para despliegue automático.
resource "aws_apigatewayv2_stage" "api_stage" {
  api_id      = aws_apigatewayv2_api.api_gateway.id  # ID de la API Gateway que tendrá el escenario.
  name        = "prod"  # Nombre del escenario (en este caso, "prod" para producción).
  auto_deploy = true  # Despliegue automático del escenario cuando se realizan cambios.
}

# Concede permisos a la API Gateway para invocar la función Lambda.
resource "aws_lambda_permission" "apigw_lambda" {
  statement_id  = "AllowAPIGatewayInvoke"  # ID de la declaración de permiso.
  action        = "lambda:InvokeFunction"  # Acción permitida (invocar la función Lambda).
  function_name = aws_lambda_function.lambda.function_name  # Nombre de la función Lambda que recibirá los permisos.
  principal     = "apigateway.amazonaws.com"  # Principal que está autorizado para invocar la función (API Gateway).
  source_arn    = "${aws_apigatewayv2_api.api_gateway.execution_arn}/*/*"  # ARN de ejecución de la API Gateway que se utiliza para invocar la función Lambda.
}
