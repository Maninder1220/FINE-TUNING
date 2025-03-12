# VPC CIDER
variable "vpc_cider_block" {}

# SUBNET
variable "public_subnet_cidr" {}


# Destination Cidr
variable "public_destination_cider" {}   # Public

# CICD ROLE NAME
variable "cicd_role_name" {}

# CODE DEPLOY APP NAME
variable "code_deploy_app_name" {}

variable "code_deploy_destroy_app_name" {}

# CODE DEPLOY GROUP NAME
variable "deployment_group_one" {}

variable "pipeline_name" {}

variable "pipeline_destroy_name" {}


variable "cicd_instance_profile_name" {}

# CODE BUILD
variable "github_repository_name" {}

variable "github-push-trigger" {}


# Github Token
variable "gh_token" {
  sensitive = true
}

