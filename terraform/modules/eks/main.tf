terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
}

variable "cluster_name" { type = string }
variable "environment" { type = string }
variable "node_count" { type = number }
variable "instance_type" { type = string }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.29"

  eks_managed_node_groups = {
    main = {
      min_size       = 1
      max_size       = var.node_count * 2
      desired_size   = var.node_count
      instance_types = [var.instance_type]
    }
  }

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
    Project     = "cloudbox"
  }
}

output "cluster_name" { value = module.eks.cluster_name }
output "cluster_endpoint" { value = module.eks.cluster_endpoint }
