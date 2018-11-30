#!/usr/bin/env bash
# Configure and deploy nginx and Blue Ocean in the cluster

PARENT_DIR=${PWD%/*}
KUBE_HOME=${HOME}/.kube
OUTPUTS="blue-ocean-pod-def blue-ocean-deployment"

kubectl create service nodeport nginx --tcp=80:80

cd ${PARENT_DIR}/terraform

terraform output nginx.conf > ${KUBE_HOME}/nginx.conf
kubectl create configmap confnginx --from-file ${KUBE_HOME}/nginx.conf

for conf in ${OUTPUTS}
do
  terraform output $conf > ${KUBE_HOME}/${conf}.yml
  kubectl create -f ${KUBE_HOME}/${conf}.yml
  if [[ $? -ne 0 ]]
  then
    echo "kubectl configuration failed with ${conf}.yml"
    exit 1
  fi
done

echo "Pod deployment complete!"
