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
    key    = "modules/high-availability/${var.env_name}.tfstate"
    region = "${var.bucket_region}"
  }
}

data "template_file" "worker_userdata" {
  template = "${file("../userdata/worker_node_userdata.sh.tpl")}"

  vars {
    cluster_endpoint = "${aws_eks_cluster.blue_ocean.endpoint}"
    cert_authority   = "${aws_eks_cluster.blue_ocean.certificate_authority.0.data}"
    cluster_name     = "${aws_eks_cluster.blue_ocean.name}"
  }
}

#data "aws_route53_zone" "base_domain" {
#  name = "${var.base_domain_name}"
#}

data "aws_ami" "eks_worker" {
  filter {
    name   = "name"
    values = ["amazon-eks-node-v*"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon EKS AMI Account ID
}
