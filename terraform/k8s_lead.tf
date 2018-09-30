#Kubernetes lead cluster
resource "aws_eks_cluster" "blue_ocean_lead" {
    name = "blue_ocean_eks_lead"
    role_arn = "${aws_iam_role.blue.arn}"

    vpc_config {
      security_group_ids =
    }
}
