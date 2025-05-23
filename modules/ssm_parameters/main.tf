resource "aws_ssm_parameter" "this" {
  for_each = var.ssm_parameters

  name        = each.key
  value       = lookup(each.value, "value", "")
  type        = lookup(each.value, "type", "SecureString")
  description = lookup(each.value, "description", null)
  key_id      = lookup(each.value, "key_id", null)
  tier        = lookup(each.value, "tier", null)
  overwrite   = lookup(each.value, "overwrite", "false") == "true" ? true : false
  allowed_pattern = lookup(each.value, "allowed_pattern", null)
}
