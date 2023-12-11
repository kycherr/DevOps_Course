output "group_url" {
  description = "GitLab Group Url"
  value       = module.gitlab.group_url
}

output "project_url" {
  description = "GitLab Oroject Url"
  value       = module.gitlab.project_url
}

output "gitlab_user_id" {
  description = "Gitlab User ID"
  value       = module.gitlab.gitlab_user_id
}

output "gitlab_group_access_token" {
  description = "GitLab Group Acces Token"
  value       = module.gitlab.gitlab_group_access_token
}

output "group_deploy_token" {
  sensitive   = true
  description = "Gitlab deploy acces token group"
  value       = module.gitlab.group_deploy_token
}

output "project_deploy_tokene" {
  sensitive   = true
  description = "Gitlab deploy acces token project"
  value       = module.gitlab.project_deploy_token
}