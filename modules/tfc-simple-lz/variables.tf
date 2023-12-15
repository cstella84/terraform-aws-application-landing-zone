## General Variables
variable "app_name" {
  type = string
  default = "my-app"
  description = "The name of the application."
}

## TFC Variables
variable "tfc_org" {
  type = string
}

## AWS Variables
variable "aws_vpc_id" {
  type = string
}

variable "aws_public_subnet_id" {
  type = string
}

variable "aws_private_subnet_id" {
  type = string
}

variable "aws_s3_bucket_arn" {
  type = string
}

## GitLab Variables
variable "gitlab_token" {
  type = string
}

variable "gitlab_base_url" {
  type = string
  default = "http://gitlab"
}