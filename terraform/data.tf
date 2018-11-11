#Entrypoint
provider "aws" {
  region = "${var.aws_region}"
}

terraform {
  backend "s3" {}
}

data "terraform_remote_state" "infrastructure" {
  backend = "s3"

  config {
    bucket = "${var.infra_bucket_name}"
    key    = "modules/${var.infra_module}/${var.env_name}.tfstate"
    region = "${var.bucket_region}"
  }
}

data "aws_route53_zone" "base_domain" {
  name = "${var.base_domain_name}"
}

data "aws_ami" "eks_worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID
}
