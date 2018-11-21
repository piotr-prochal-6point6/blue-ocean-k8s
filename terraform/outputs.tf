output "kubeconfig" {
  value = "${local.kubeconfig}"
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
