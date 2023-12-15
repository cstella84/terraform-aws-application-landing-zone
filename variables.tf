variable "tfc_token" {
  type = string
}

variable "tfc_org" {
  type = string
}

variable "app_name" {
  type        = string
  default     = "my-app"
  description = "The name of the application."
}

variable "gitlab_token" {
  type = string
}

variable "gitlab_base_url" {
  type    = string
  default = "http://gitlab"
}