variable "app_name" {
  type = string
  default = "my-app"
  description = "The name of the application."
}

variable "aws_vpc_cidr_block" {
  type = string
  default = "10.0.0.0/16"
  description = "The CIDR block to use for the VPC."
}

variable "aws_public_subnet_cidr_block" {
  type = string
  default = "10.0.1.0/24"
  description = "The CIDR block to use for the public subnet."
}

variable "aws_private_subnet_cidr_block" {
  type = string
  default = "10.0.2.0/24"
  description = "The CIDR block to use for the private subnet."
}
