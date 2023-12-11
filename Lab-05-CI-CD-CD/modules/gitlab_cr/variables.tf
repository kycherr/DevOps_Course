
variable "group_topic" {
  description = "Group topic"
  type        = string
}

variable "course_name" {
  description = "Course name)"
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
  description = "Gitlab deploy token group scopes"
  type        = list(string)
  default     = []
}

variable "gitlab_user_email" {
  description = "Get GitLab user email"
  type        = string
}