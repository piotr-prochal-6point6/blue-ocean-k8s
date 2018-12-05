#!/usr/bin/env bash
# Configure and deploy nginx and Blue Ocean in the cluster

PARENT_DIR=${PWD%/*}
KUBE_HOME=${HOME}/.kube
YAMLS="blue-ocean-pod-def blue-ocean-deployment"

kubectl create service nodeport nginx --tcp=80:80

cd ${PARENT_DIR}/terraform

terraform output nginx.conf > ${PARENT_DIR}/kube/nginx.conf
kubectl create configmap confnginx --from-file ${PARENT_DIR}/kube/nginx.conf

for conf in ${YAMLS}
do
  kubectl create -f ${PARENT_DIR}/kube/${conf}.yml
  if [[ $? -ne 0 ]]
  then
    echo "kubectl configuration failed with ${conf}.yml"
    exit 1
  fi
done

echo "Pod deployment complete!"
