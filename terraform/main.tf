terraform {
  required_version = ">= 1.3.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}


provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = "demo-eks"
  cluster_version = "1.29"

  vpc_id     = "vpc-062705c97c37cc843"
  subnet_ids = [
    "subnet-056ffe4638c24d273",
    "subnet-0909f92c152869571"
  ]

  # ✅ Enable control plane logs (fixes Trivy warnings)
  cluster_enabled_log_types = [
    "api",
    "audit",
    "authenticator",
    "controllerManager",
    "scheduler"
  ]

  eks_managed_node_groups = {
    default = {
      desired_size = 2
      min_size     = 1
      max_size     = 2

      instance_types = ["t3.medium"]
    }
  }
}
