# Blue Ocean AWS

[Jenkins Blue Ocean](https://jenkins.io/projects/blueocean/) CI server with [HashiCorp Terraform](https://terraform.io) configuration for installing it into [EKS](https://aws.amazon.com/eks/).

#### To install

    cd terraform
    terraform init -backend-config=backend-config/<env_name>
    terraform plan -var-file=vars/<env_name>.tfvars -out <env_name>.plan
    terraform apply <env_name>.plan
    ../sh/cluster-config.sh
    ../sh/pod-deploy.sh

#### To destroy

    cd terraform
    terraform destroy -var-file=vars/<env_name>.tfvars -auto-approve

_N.B. the tfvars files must be populated before planning_
