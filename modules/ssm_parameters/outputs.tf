output "parameter_arns" {
  value       = { for k, p in aws_ssm_parameter.this : k => p.arn }
  description = "ARNs of created SSM parameters."
}

output "parameter_names" {
  value       = [for p in aws_ssm_parameter.this : p.name]
  description = "Names of created SSM parameters."
}
