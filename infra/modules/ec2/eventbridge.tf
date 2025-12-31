resource "aws_cloudwatch_event_rule" "cpu_alarm_state" {
  name = "selfhealing-cpu-alarm-rule"

  event_pattern = jsonencode({
    source      = ["aws.cloudwatch"]
    detail-type = ["CloudWatch Alarm State Change"]
    detail = {
      alarmName = ["selfhealing-high-cpu"]
      state = {
        value = ["ALARM"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule = aws_cloudwatch_event_rule.cpu_alarm_state.name
  arn  = aws_lambda_function.selfhealing_ec2_reboot.arn
}

resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowEventBridgeInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.selfhealing_ec2_reboot.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.cpu_alarm_state.arn
}