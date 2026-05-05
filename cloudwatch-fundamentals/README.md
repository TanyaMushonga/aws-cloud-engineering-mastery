# AWS CloudWatch Fundamentals: Metrics and Alarms Guide

This module provides a basic Terraform configuration to demonstrate how to set up AWS CloudWatch Metrics and Alarms.

## Overview

Amazon CloudWatch is a monitoring and observability service that provides data and actionable insights to monitor applications, respond to system-wide performance changes, optimize resource utilization, and get a unified view of operational health.

This module sets up:
- An **SNS Topic** to receive alarm notifications.
- A **CloudWatch Metric Alarm** that monitors the `CPUUtilization` metric for an EC2 instance. It is configured to trigger if the CPU utilization exceeds 80% over two consecutive 120-second periods.

## Resources Created

- `aws_sns_topic.alarm_notifications`: Receives alerts when the alarm state changes.
- `aws_cloudwatch_metric_alarm.cpu_high_alarm`: Monitors EC2 CPU metrics and triggers the SNS topic.

## Usage

1. Initialize the Terraform module:
   ```bash
   terraform init
   ```

2. Review the plan:
   ```bash
   terraform plan
   ```
   *Note: By default, this uses a placeholder EC2 Instance ID. You can override it by passing `-var="instance_id=i-xxxxxxx"`.*

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. You can also manually subscribe an email address or another endpoint to the created SNS topic via the AWS Console or CLI to actually receive notifications.
