variable "landing_zone_providers" {
  type        = map(map(string))
  description = "The list of AWS providers."
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster."
}

variable "subnet_ids" {
  type        = list(string)
  description = "Subnet IDs for the EKS cluster nodes."
}

variable "environment" {
  type        = string
  description = "Deployment environment name."
  default     = "dev"
}
