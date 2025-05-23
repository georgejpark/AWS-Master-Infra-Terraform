variable "landing_zone_providers" {
  type        = map(map(string))
  description = "The list of AWS providers."
}

variable "repository_name" {
  type        = string
  description = "Name of the ECR repository."
}

variable "lifecycle_policy" {
  type        = string
  description = "JSON lifecycle policy for the repository."
  default     = ""
}
