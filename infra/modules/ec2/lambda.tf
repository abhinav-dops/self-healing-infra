resource "aws_lambda_function" "selfhealing" {
  function_name = "selfhealing-ec2-reboot"
  role          = aws_iam_role.lambda_role.arn
  handler       = "reboot_ec2.lambda_handler"
  runtime       = "python3.11"

  filename         = "${path.module}/lambda/function.zip"
  source_code_hash = filebase64sha256("${path.module}/lambda/function.zip")

  environment {
    variables = {
      INSTANCE_ID = aws_instance.app_ec2.id
    }
  }
}
