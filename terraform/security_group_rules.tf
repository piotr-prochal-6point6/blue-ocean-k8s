#Security Group Rules
resource "aws_security_group_rule" "operator_ingress" {
  cidr_blocks       = ["${var.operator_cidr_blocks}"]
  description       = "Allow operators to access the cluster"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = "${aws_security_group.blue_ocean_lead_cluster.id}"
  type              = "ingress"
}
