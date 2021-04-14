output "arn" {
  value       = module.ecr.arn 
}
output "id" {
  value       = module.ecr.id 
}
output "name" {
  value       = module.ecr.name 
}
output "registry_id" {
  value       = module.ecr.registry_id 
}
output "repository_url" {
  value       = module.ecr.repository_url 
}

output "policy_registry_id" {
  value       = module.policy.registry_id 
}
output "policy_id" {
  value       = module.policy.id 
}