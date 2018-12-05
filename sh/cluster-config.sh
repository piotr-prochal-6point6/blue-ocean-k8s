#!/usr/bin/env bash
# Configure and join worker nodes to the cluster

PARENT_DIR=${PWD%/*}
KUBE_HOME=${HOME}/.kube
KUBECONFIG="config.eks"
OUTPUTS="config-map-aws-auth"

cd ${PARENT_DIR}/terraform
terraform output ${KUBECONFIG} > ${KUBE_HOME}/${KUBECONFIG}
rm ${KUBE_HOME}/config
ln -s ${KUBE_HOME}/${KUBECONFIG} ${KUBE_HOME}/config

for conf in ${OUTPUTS}
do
  terraform output $conf > ${PARENT_DIR}/kube/${conf}.yml
  kubectl apply -f ${PARENT_DIR}/kube/${conf}.yml
  if [[ $? -ne 0 ]]
  then
    echo "kubectl configuration failed with ${conf}.yml"
    exit 1
  fi
done

kubectl apply -f ${PARENT_DIR}/kube/storage-class.yml
kubectl patch storageclass gp2 -p '{"metadata": {"annotations":{"storageclass.kubernetes.io/is-default-class":"true"}}}'
kubectl get storageclass

echo "Basic cluster configuration complete!"
