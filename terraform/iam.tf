#Identity and Access Management
resource "aws_iam_role" "blue_ocean_eks_cluster" {
  name               = "blue-ocean-eks-cluster"
  assume_role_policy = "${file("../iam/blue-ocean-eks-cluster-policy.json")}"
}

resource "aws_iam_role" "blue_ocean_eks_node" {
  name               = "blue-ocean-eks-node"
  assume_role_policy = "${file("../iam/blue-ocean-eks-node-policy.json")}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.blue_ocean_eks_cluster.name}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.blue_ocean_eks_cluster.name}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_node_AmazonEKSWorkerNodePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
  role       = "${aws_iam_role.blue_ocean_eks_node.name}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_node_AmazonEKS_CNI_Policy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
  role       = "${aws_iam_role.blue_ocean_eks_node.name}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_node_AmazonEC2ContainerRegistryReadOnly" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
  role       = "${aws_iam_role.blue_ocean_eks_node.name}"
}

resource "aws_iam_instance_profile" "blue_ocean_eks_node" {
  name = "blue-ocean-eks"
  role = "${aws_iam_role.blue_ocean_eks_node.name}"
}

resource "aws_ecr_repository_policy" "internal_repo_policy" {
  repository = "${aws_ecr_repository.internal.name}"
  policy     = "${file("../iam/ecr_repository_policy.json")}"
}

resource "aws_ecr_lifecycle_policy" "internal" {
  repository = "${aws_ecr_repository.internal.name}"
  policy     = "${file("../iam/ecr_lifecycle_policy.json")}"
}
