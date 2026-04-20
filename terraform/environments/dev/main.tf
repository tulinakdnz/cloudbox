terraform {
  required_providers {
    aws = { source = "hashicorp/aws", version = "~> 5.0" }
  }
  backend "local" {
    path = "terraform.tfstate"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "eks_dev" {
  source        = "../../modules/eks"
  cluster_name  = "cloudbox-dev"
  environment   = "dev"
  node_count    = 2
  instance_type = "t3.small"
}
