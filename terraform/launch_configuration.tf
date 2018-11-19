#Launch Configuration
resource "aws_launch_configuration" "blue_ocean_eks" {
  associate_public_ip_address = true
  iam_instance_profile        = "${aws_iam_instance_profile.blue_ocean_eks_node.name}"
  image_id                    = "${data.aws_ami.eks_worker.id}"
  instance_type               = "${var.node_instance_type}"
  name_prefix                 = "blue-ocean-eks-node-"
  security_groups             = ["${aws_security_group.blue_ocean_cluster_node.id}"]
  user_data_base64            = "${base64encode(data.template_file.worker_userdata.rendered)}"

  lifecycle {
    create_before_destroy = true
  }

  root_block_device {
    delete_on_termination = true
  }
}
