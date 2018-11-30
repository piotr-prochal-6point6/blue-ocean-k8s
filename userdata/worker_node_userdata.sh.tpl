#!/bin/bash
set -o xtrace
mkdir -p /var/log/nginx/jenkins
/etc/eks/bootstrap.sh --apiserver-endpoint '${cluster_endpoint}' --b64-cluster-ca '${cert_authority}' '${cluster_name}'
