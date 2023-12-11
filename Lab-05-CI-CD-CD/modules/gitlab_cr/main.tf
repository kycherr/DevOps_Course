# Create a group with custom topic subname
resource "gitlab_group" "gtl_gr" {
  name             = "${var.course_name}_${var.group_topic}"
  path             = "${var.course_name}_${var.group_topic}"
  lfs_enabled      = "true"
  visibility_level = "public"
  description      = "${var.course_name}-Group"
}

# Create a repo in gtl_gr WA-23-Group topic_project sequence
resource "gitlab_project" "gtl_pr" {
  name                   = "${var.course_name}_${var.group_topic}_${var.pr_descr}"
  description            = "${var.course_name}_${var.pr_descr} gen by terraform"
  namespace_id           = gitlab_group.gtl_gr.id
  approvals_before_merge = 2
  initialize_with_readme = true
  push_rules {
    reject_unsigned_commits = true
    prevent_secrets         = true
  }
}

resource "gitlab_group_access_token" "gtl_gr" {
  group        = gitlab_group.gtl_gr.id
  name         = "Group Acces Token"
  expires_at   = "2023-09-30"
  access_level = "owner"

  scopes = ["api"]
}

resource "gitlab_group_variable" "gtl_gr_var" {
  group = gitlab_group.gtl_gr.id
  key   = "gat"
  value = gitlab_group_access_token.gtl_gr.token
}


resource "gitlab_deploy_token" "gtl_dp_pr" {
  project    = gitlab_project.gtl_pr.id
  name       = "Group Deploy Token"
  username   = var.gtl_dp_username
  expires_at = "2023-10-14T00:00:00.000Z"

  scopes = var.gtl_dp_pr_scopes
}

# Group
resource "gitlab_deploy_token" "gtl_dp_gr" {
  group = gitlab_group.gtl_gr.id
  name  = "${var.course_name}_${var.group_topic}_Deploy token"

  scopes = var.gtl_dp_gr_scopes
}

resource "gitlab_branch" "gtl_pr_br" {
  name    = "feature/gitlab_module"
  ref     = "main"
  project = gitlab_project.gtl_pr.id
}

resource "gitlab_branch_protection" "gtl_pr_br_pr" {
  project                = gitlab_project.gtl_pr.id
  branch                 = gitlab_branch.gtl_pr_br.name
  push_access_level      = "developer"
  merge_access_level     = "developer"
  unprotect_access_level = "maintainer"
  allowed_to_push {
    user_id = data.gitlab_user.get_gtl_user.id
  }
}
