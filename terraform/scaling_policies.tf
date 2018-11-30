#Scaling policies
resource "aws_autoscaling_policy" "eks_scale_up" {
  name                   = "worker_node_scale_up_policy"
  autoscaling_group_name = "${aws_autoscaling_group.blue_ocean_eks.name}"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = 1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 1200
}

resource "aws_autoscaling_policy" "eks_scale_down" {
  name                   = "worker_node_scale_down_policy"
  autoscaling_group_name = "${aws_autoscaling_group.blue_ocean_eks.name}"
  policy_type            = "SimpleScaling"
  scaling_adjustment     = -1
  adjustment_type        = "ChangeInCapacity"
  cooldown               = 2400
}
