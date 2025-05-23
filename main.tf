module "landing_zone" {
  source                  = "./modules/landing_zone"
  root_path               = path.module
  landing_zone_providers  = var.landing_zone_providers
  landing_zone_components = var.landing_zone_components
  terraform_backend       = var.terraform_backend
  terraform_config        = var.terraform_config
}

module "ssm_parameters" {
  source                 = "./modules/ssm_parameters"
  landing_zone_providers = var.landing_zone_providers
  ssm_parameters         = var.ssm_parameters
}

module "eks" {
  source                 = "./modules/eks"
  count                  = var.eks_cluster_name[var.environment] == "" ? 0 : 1
  landing_zone_providers = var.landing_zone_providers
  cluster_name           = var.eks_cluster_name[var.environment]
  subnet_ids             = var.eks_subnet_ids[var.environment]
  environment            = var.environment
}

module "ecr" {
  source                 = "./modules/ecr"
  count                  = var.ecr_repository_name[var.environment] == "" ? 0 : 1
  landing_zone_providers = var.landing_zone_providers
  repository_name        = var.ecr_repository_name[var.environment]
  lifecycle_policy       = var.ecr_lifecycle_policy
}
