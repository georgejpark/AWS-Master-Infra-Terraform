locals {
  eks_subnet_ids = {
    dev   = ["subnet-12345678", "subnet-23456789"]
    stage = ["subnet-34567890", "subnet-45678901"]
    prod  = ["subnet-56789012", "subnet-67890123"]
  }
}

module "eks" {
  source                 = "../../modules/eks"
  landing_zone_providers = {
    default = {
      account_id = "123456789012"
      region     = "us-east-1"
    }
  }
  cluster_name = {
    dev   = "dev-eks"
    stage = "stage-eks"
    prod  = "prod-eks"
  }[var.environment]
  subnet_ids   = local.eks_subnet_ids[var.environment]
  environment  = var.environment
}

module "ecr" {
  source                 = "../../modules/ecr"
  landing_zone_providers = {
    default = {
      account_id = "123456789012"
      region     = "us-east-1"
    }
  }
  repository_name  = {
    dev   = "dev-repo"
    stage = "stage-repo"
    prod  = "prod-repo"
  }[var.environment]
}
