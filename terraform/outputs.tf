output "config.eks" {
  value = "${local.config_eks}"
}

output "config-map-aws-auth" {
  value = "${local.config_map_aws_auth}"
}

output "storageclass" {
  value = "${local.storageclass}"
}

output "rbac-config" {
  value = "${local.rbac_config}"
}

output "ecr_repo_url" {
  value = "${aws_ecr_repository.internal.repository_url}"
}

output "blue-ocean-pod-def" {
  value = "${local.blue_ocean}"
}

output "blue-ocean-deployment" {
  value = "${local.deployment}"
}

output "nginx.conf" {
  value = "${local.nginxconf}"
}
