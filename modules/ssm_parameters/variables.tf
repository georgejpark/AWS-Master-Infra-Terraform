variable "landing_zone_providers" {
  type        = map(map(string))
  description = "The list of AWS providers."
}

variable "ssm_parameters" {
  type        = map(map(string))
  description = "Map of SSM parameter configurations keyed by name."
}
