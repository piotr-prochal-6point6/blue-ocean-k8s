variable "aws_region" {
  default = "eu-west-1"
}

variable "env_name" {}

variable "base_domain_name" {}

variable "operator_cidr_blocks" {}

variable "cluster_name" {
  description = "The name of our cluster"
  default     = "${var.env_name}-jenkins-blue-ocean"
}

variable "infra_module" {
  description = "The infrastructure module we're using"
  default     = ["high-availability", "single-az"]
}

variable "bucket_region" {
  default = "eu-west-2"
}

variable "infra_bucket_name" {
  description = "The Terraform backend S3 bucket name"
  default     = "terraform-infrastructure-modules-backend-bucket"
}
