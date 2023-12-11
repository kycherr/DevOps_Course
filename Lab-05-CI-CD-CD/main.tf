provider "gitlab" {
  token    = var.gitlab_token
  base_url = var.gitlab_url
}

module "gitlab" {
  source            = "./modules/gitlab_cr"
  group_topic       = var.group_topic
  course_name       = var.course_name
  pr_descr          = var.pr_descr
  gtl_dp_username   = var.gtl_dp_username
  gtl_dp_gr_scopes  = var.gtl_dp_gr_scopes
  gtl_dp_pr_scopes  = var.gtl_dp_pr_scopes
  gitlab_user_email = var.gitlab_user_email
}