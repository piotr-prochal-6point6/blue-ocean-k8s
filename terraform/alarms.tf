#CloudWatch alarms
resource "aws_cloudwatch_metric_alarm" "eks_scaling_alarm" {
  alarm_name          = "WorkerNodeScalingAlarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  alarm_description   = "Alarm governing scaling of the app server group according to ELB RequestCount"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Sum"
  threshold           = 70

  dimensions {
    AutoScalingGroupName = "${aws_autoscaling_group.blue_ocean_eks.name}"
  }

  alarm_actions = ["${aws_autoscaling_policy.eks_scale_up.arn}"]
  ok_actions    = ["${aws_autoscaling_policy.eks_scale_down.arn}"]
}
