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
