#Security Groups
resource "aws_security_group" "blue_ocean_lead_cluster" {
  name   = "blue-ocean-lead-sg"
  vpc_id = "${data.terraform_remote_state.infrastructure.main_vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags {
    Name = "blue-ocean-lead-sg"
  }
}

resource "aws_security_group" "blue_ocean_node" {
  name        = "blue-ocean-eks-node"
  description = "Security group for all nodes in the cluster"
  vpc_id      = "${data.terraform_remote_state.infrastructure.main_vpc_id}"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = "${
    map(
     "Name", "blue-ocean-eks-node",
     "kubernetes.io/cluster/${var.cluster_name}", "owned",
    )
  }"
}
