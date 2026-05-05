terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

# SNS Topic for Alarm Notifications
resource "aws_sns_topic" "alarm_notifications" {
  name = "cloudwatch-alarms-topic"
}

# CloudWatch Metric Alarm for CPU Utilization
# This alarm will trigger if CPU utilization exceeds 80% for 2 consecutive periods of 120 seconds.
resource "aws_cloudwatch_metric_alarm" "cpu_high_alarm" {
  alarm_name          = "HighCPUUtilization"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 120
  statistic           = "Average"
  threshold           = 80
  alarm_description   = "This metric monitors ec2 cpu utilization"

  # We use a placeholder for InstanceId, this could be passed via a variable
  dimensions = {
    InstanceId = var.instance_id
  }

  alarm_actions = [aws_sns_topic.alarm_notifications.arn]
}
