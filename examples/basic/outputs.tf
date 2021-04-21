#ecr
output "arn" {
  value       = module.create_ecr.arn 
}
output "id" {
  value       = module.create_ecr.id 
}
output "registry_id" {
  value       = module.create_ecr.registry_id 
}
output "repository_url" {
  value       = module.create_ecr.repository_url 
}
#policy
output "policy_registry_id" {
  value       = module.create_ecr.policy_registry_id 
}
output "policy_id" {
  value       = module.create_ecr.policy_id 
}
