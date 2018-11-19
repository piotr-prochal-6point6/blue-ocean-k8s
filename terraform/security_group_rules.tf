#Security Group Rules
resource "aws_security_group_rule" "operator_ingress" {
  cidr_blocks       = ["${var.operator_cidr_blocks}"]
  description       = "Allow operators to access the cluster"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.blue_ocean_cluster_lead.id}"
  type              = "ingress"
}

resource "aws_security_group_rule" "blue_ocean_node_ingress_self" {
  description              = "Allow nodes to communicate with each other"
  from_port                = 0
  protocol                 = "-1"
  security_group_id        = "${aws_security_group.blue_ocean_cluster_node.id}"
  source_security_group_id = "${aws_security_group.blue_ocean_cluster_node.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "blue_ocean_node_ingress_cluster" {
  description              = "Allow worker Kubelets and pods to receive communication from the cluster control plane"
  from_port                = 1025
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.blue_ocean_cluster_node.id}"
  source_security_group_id = "${aws_security_group.blue_ocean_cluster_lead.id}"
  to_port                  = 65535
  type                     = "ingress"
}

resource "aws_security_group_rule" "blue_ocean_cluster_ingress_node_https" {
  description              = "Allow pods to communicate with the cluster API Server"
  from_port                = 443
  protocol                 = "tcp"
  security_group_id        = "${aws_security_group.blue_ocean_cluster_lead.id}"
  source_security_group_id = "${aws_security_group.blue_ocean_cluster_node.id}"
  to_port                  = 443
  type                     = "ingress"
}
