output "registry_id" {
  value       = { for k, v in aws_ecr_lifecycle_policy.ecr_policy_this : k => v.registry_id }
}
output "id" {
  value       = { for k, v in aws_ecr_lifecycle_policy.ecr_policy_this : k => v.id }
}