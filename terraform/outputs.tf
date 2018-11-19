output "kubeconfig" {
  value = "${local.kubeconfig}"
}

output "config_map_aws_auth" {
  value = "${local.config_map_aws_auth}"
}

output "storageclass" {
  value = "${local.storageclass}"
}

output "rbac_config" {
  value = "${local.rbac_config}"
}

output "ecr_repo_url" {
  value = "${aws_ecr_repository.internal.repository_url}"
}
