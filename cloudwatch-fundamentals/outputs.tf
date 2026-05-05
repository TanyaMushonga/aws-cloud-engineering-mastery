output "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarms"
  value       = aws_sns_topic.alarm_notifications.arn
}

output "cloudwatch_alarm_id" {
  description = "The ID of the CloudWatch alarm"
  value       = aws_cloudwatch_metric_alarm.cpu_high_alarm.id
}
