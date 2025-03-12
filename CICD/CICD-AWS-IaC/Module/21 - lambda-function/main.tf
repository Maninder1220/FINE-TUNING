# Lambda Function
resource "aws_lambda_function" "gh_lam_function" {
  function_name = "github-push-handler"
  runtime       = "python3.9"
  role          = var.assume_role_arn
  handler       = "lambda_function.lambda_handler"

  filename         = "../../CICD/mRoot/lambda-function.zip"
  source_code_hash = filebase64sha256("../../CICD/mRoot/lambda-function.zip")
}