#Autoscaling Groups
resource "aws_autoscaling_group" "blue_ocean_eks" {
  launch_configuration = "${aws_launch_configuration.blue_ocean_eks.id}"
  max_size             = 6
  min_size             = 1
  desired_capacity     = 3
  name                 = "blue-ocean-eks"
  vpc_zone_identifier  = ["${data.terraform_remote_state.infrastructure.private_subnet_ids}"]

  tag {
    key                 = "Name"
    value               = "blue-ocean-eks"
    propagate_at_launch = true
  }

  tag {
    key                 = "kubernetes.io/cluster/${aws_eks_cluster.blue_ocean.name}"
    value               = "owned"
    propagate_at_launch = true
  }
}
