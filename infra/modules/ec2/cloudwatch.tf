resource "aws_cloudwatch_metric_alarm" "high_cpu" {
  alarm_name          = "selfhealing-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Average"
  threshold           = 80

  dimensions = {
    InstanceId = aws_instance.app_ec2.id
  }

  alarm_description = "Trigger when cpu exceeds 80%"
}

resource "aws_cloudwatch_metric_alarm" "ec2_status_failed" {
  alarm_name          = "selfhealing-ec2-status-failed"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 1
  metric_name         = "StatusCheckFailed_System"
  namespace           = "AWS/EC2"
  period              = 60
  statistic           = "Maximum"
  threshold           = 0

  dimensions = {
    InstanceId = aws_instance.app_ec2.id
  }

  alarm_description = "Trigger When Ec2 system status check fails"
}
