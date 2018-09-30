#Identity and Access Management
resource "aws_iam_role" "blue_ocean_eks_cluster" {
  name               = "blue-ocean-eks-cluster"
  assume_role_policy = "${file(../iam/blue-ocean-eks-cluster-policy.json)}"
}

resource "aws_iam_role_policy_attachment" "blue_ocean_eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = "${aws_iam_role.blue_ocean_eks_cluster.name}"
}

resource "aws_iam_role" "blue_ocean_eks_cluster_AmazonEKSServicePolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
  role       = "${aws_iam_role.blue_ocean_eks_cluster.name}"
}
