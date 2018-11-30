# Blue Ocean AWS

[Jenkins Blue Ocean](https://jenkins.io/projects/blueocean/) CI server with [HashiCorp Terraform](https://terraform.io) configuration for installing it into [EKS](https://aws.amazon.com/eks/).

#### To install

    cd terraform
    terraform init -backend-config=backend-config/<env_name>
    terraform plan -var env_name=<env_name> -var operator_cidr_blocks=<operator_cidr_blocks> -var base_domain_name=<base_domain_name> -out <env_name>.plan
    terraform apply <env_name>.plan
    ../sh/cluster-config.sh
    ../sh/pod-deploy.sh

#### To destroy

    cd terraform
    terraform destroy -var env_name=<env_name> -var operator_cidr_blocks=<operator_cidr_blocks> -var base_domain_name=<base_domain_name> -auto-approve

The toolset provides:

_TODO: List of components and tools provided here_
