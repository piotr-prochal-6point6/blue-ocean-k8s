#!/bin/bash
set -o xtrace
/etc/eks/bootstrap.sh --apiserver-endpoint '${aws_eks_cluster.blue_ocean_lead.endpoint}' --b64-cluster-ca '${aws_eks_cluster.blue_ocean_lead.certificate_authority.0.data}' '${var.cluster_name}'
