#Amazon EC2 Container Registry
resource "aws_ecr_repository" "internal" {
  name = "${aws_eks_cluster.blue_ocean.name}-ecr-repo"
}
