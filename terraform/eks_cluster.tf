#EKS cluster lead
resource "aws_eks_cluster" "blue_ocean" {
  name     = "${var.env_name}-${var.cluster_base_name}"
  role_arn = "${aws_iam_role.blue_ocean_eks_cluster.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.blue_ocean_cluster_lead.id}"]
    subnet_ids         = ["${data.terraform_remote_state.infrastructure.private_subnet_ids}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.blue_ocean_eks_cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.blue_ocean_eks_cluster_AmazonEKSServicePolicy",
  ]
}
