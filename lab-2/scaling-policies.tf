
/* Scale Down */

resource "aws_autoscaling_policy" "SqsScaleDown" {
  name = "SqsScaleDown"
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"

  policy_type = "StepScaling"

  step_adjustment {
    scaling_adjustment = -1
    metric_interval_upper_bound = 0
  }
}

resource "aws_cloudwatch_metric_alarm" "SqsScaleDown" {
  alarm_name = "lab-2-SqsScaleDown-Alarm"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods = 5
  metric_name = "ApproximateNumberOfMessagesVisible"
  namespace = "AWS/SQS"
  period = 60
  threshold = 10

  statistic = "Sum"

  alarm_actions = ["${aws_autoscaling_policy.SqsScaleDown.arn}"]
}

/* Scale Up */

resource "aws_autoscaling_policy" "SqsScaleUp" {
  adjustment_type = "ChangeInCapacity"
  autoscaling_group_name = "${aws_autoscaling_group.asg.name}"
  name = "SqsScaleUp"

  policy_type = "StepScaling"
  estimated_instance_warmup = 600

  step_adjustment {
    scaling_adjustment = 2
    metric_interval_lower_bound = 50
  }
}

resource "aws_cloudwatch_metric_alarm" "SqsScaleUp" {
  alarm_name = "lab-2-SqsScaleUp-Alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods = 3
  metric_name = "ApproximateNumberOfMessagesVisible"
  namespace = "AWS/SQS"
  period = 60
  threshold = 50

  statistic = "Sum"

  alarm_actions     = ["${aws_autoscaling_policy.SqsScaleUp.arn}"]
}
