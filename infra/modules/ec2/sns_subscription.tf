resource "aws_sns_topic_subscription" "lambda_sub" {
  topic_arn = aws_sns_topic.selfhealing.arn
  protocol  = "lambda"
  endpoint  = aws_lambda_function.selfhealing.arn
}

resource "aws_lambda_permission" "allow_sns" {
  statement_id  = "AllowExecutionFromSNS"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.selfhealing.function_name
  principal     = "sns.amazonaws.com"
  source_arn    = aws_sns_topic.selfhealing.arn
}
