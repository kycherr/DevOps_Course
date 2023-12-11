variable "gitlab_url" {
  description = "GitLab Base Url"
  type        = string
}

variable "gitlab_token" {
  description = "Git Lab Acces Token"
  type        = string
}


variable "group_topic" {
  description = "Group topic"
  type        = string
}

variable "course_name" {
  description = "Course name)"
  type        = string
}

variable "gitlab_user_email" {
  description = "Get Git Lab user email"
  type        = string
}
variable "pr_descr" {
  description = "Project seq num"
  type        = string
}

variable "gtl_dp_username" {
  description = "Gitlab deploy token username"
  type        = string
}

variable "gtl_dp_pr_scopes" {
  description = "Gitlab deploy token projectce scopes"
  type        = list(string)
  default     = []
}

variable "gtl_dp_gr_scopes" {
  description = "add Gitlab deploy token group scopes"
  type        = list(string)
  default     = []
}

