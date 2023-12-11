output "group_url" {
  description = "GitLab Group Url"
  value       = gitlab_group.gtl_gr.web_url
}

output "project_url" {
  description = "GitLab Oroject Url"
  value       = gitlab_project.gtl_pr.web_url
}

output "gitlab_group_access_token" {
  description = "GitLab Group Acces Token"
  value       = nonsensitive(gitlab_group_access_token.gtl_gr.token)

}

output "group_deploy_token" {
  sensitive   = true
  description = "Gitlab deploy acces token group"
  value       = nonsensitive(gitlab_deploy_token.gtl_dp_gr.token)
}

output "project_deploy_token" {
  sensitive   = true
  description = "Gitlab deploy acces token project"
  value       = gitlab_deploy_token.gtl_dp_pr.token
}

output "gitlab_user_id" {
  value = data.gitlab_user.get_gtl_user.id
}
