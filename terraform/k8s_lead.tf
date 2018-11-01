#Kubernetes lead cluster
resource "aws_eks_cluster" "blue_ocean_lead" {
  name     = "blue_ocean_eks_lead"
  role_arn = "${aws_iam_role.blue.arn}"

  vpc_config {
    security_group_ids = ["${aws_security_group.blue_ocean_lead_cluster.id}"]
    subnet_ids         = ["${data.terraform_remote_state.infrastructure.private_subnet_ids}"]
  }

  depends_on = [
    "aws_iam_role_policy_attachment.blue_ocean_eks_cluster_AmazonEKSClusterPolicy",
    "aws_iam_role_policy_attachment.blue_ocean_eks_cluster_AmazonEKSServicePolicy",
  ]
}
