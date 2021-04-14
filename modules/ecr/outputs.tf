output "arn" {
  value       = { for k, v in aws_ecr_repository.ecr_this : k => v.arn }
}
output "id" {
  value       = { for k, v in aws_ecr_repository.ecr_this : k => v.id }
}
output "name" {
  value       = { for k, v in aws_ecr_repository.ecr_this : k => v.name }
}
output "registry_id" {
  value       = { for k, v in aws_ecr_repository.ecr_this : k => v.registry_id }
}
output "repository_url" {
  value       = { for k, v in aws_ecr_repository.ecr_this : k => v.repository_url }
}
