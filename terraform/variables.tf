variable "aws_region" {
  default = "eu-west-1"
}

variable "env_name" {}

#variable "base_domain_name" {}

variable "operator_cidr_blocks" {}

variable "cluster_base_name" {
  description = "The base name of our cluster"
  default     = "jenkins-blue-ocean"
}

variable "node_instance_type" {
  description = "EKS worker node instance type"
  default     = "m4.large"
}

variable "bucket_region" {
  default = "eu-west-2"
}

variable "infra_bucket_name" {
  description = "The Terraform backend S3 bucket name"
  default     = "terraform-infrastructure-modules-backend-bucket"
}
