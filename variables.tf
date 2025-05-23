variable "landing_zone_providers" {
  type        = map(map(string))
  description = "The list of AWS providers."
}

variable "landing_zone_components" {
  type        = map(string)
  description = "This is the list of AWS Landing Zone components that will be deployed if corresponding `.tfvars` file is included."
}

variable "terraform_backend" {
  type        = map(string)
  description = "This is the backend configure for all components."
  default     = {
    backend = "local"
    path    = "/tmp/.terrahub/landing_zone"
  }
}

variable "terraform_config" {
  type        = bool
  default     = true
  description = "The command that will be generate the `terraform` config file."
}

variable "ssm_parameters" {
  type        = map(map(string))
  description = "Map of SSM parameter configurations keyed by parameter name."
  default     = {}
}


variable "environment" {
  type        = string
  description = "Deployment environment (dev, stage, prod)."
  default     = "dev"
}

variable "eks_cluster_name" {
  type        = map(string)
  description = "EKS cluster name per environment. Empty name disables EKS module."
  default = {
    dev   = "dev-eks"
    stage = "stage-eks"
    prod  = "prod-eks"
  }
}

variable "eks_subnet_ids" {
  type        = map(list(string))
  description = "Subnet IDs for the EKS cluster nodes per environment."
  default = {
    dev   = []
    stage = []
    prod  = []
  }
}

variable "ecr_repository_name" {
  type        = map(string)
  description = "ECR repository name per environment. Empty name disables ECR module."
  default = {
    dev   = "dev-repo"
    stage = "stage-repo"
    prod  = "prod-repo"
  }
}

variable "ecr_lifecycle_policy" {
  type        = string
  description = "Optional JSON lifecycle policy for ECR repository."
  default     = ""
}
