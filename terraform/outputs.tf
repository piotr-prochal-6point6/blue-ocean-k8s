output "config.eks" {
  value = "${local.config_eks}"
}

output "config-map-aws-auth" {
  value = "${local.config_map_aws_auth}"
}

output "storageclass" {
  value = "${local.storageclass}"
}

output "ecr_repo_url" {
  value = "${aws_ecr_repository.internal.repository_url}"
}

output "nginx.conf" {
  value = "${local.nginxconf}"
}
