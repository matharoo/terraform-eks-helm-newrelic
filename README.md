# EKS Cluster with New Relic agent helm deployment

Terraform project to help spin up an EKS cluster using `terraform-aws-modules/eks/aws` module and then do help deploy of newrelic agent for getting AWS RDS metrics sent to your New Relic, using the helm provider for terraform https://github.com/hashicorp/terraform-provider-helm.