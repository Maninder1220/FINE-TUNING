# VPC CIDER
variable "vpc_cider_block" {}

# SUBNET
variable "private_subnet" {}
variable "public_subnet" {}

# Public CIDR
variable "public_destination_cider" {}
variable "private_destination_cider" {}

/*
# VPC ID
variable "vpc_id" {}

# SUBNETS ID
variable "public_subnet_id" {}
variable "private_subnet_id" {}


# IG ID
variable "ig_id" {}

# NAT ID
variable "nat_gateway_id" {}

# NACL ID
variable "n_acl_id" {}

*/

# Code Commit
variable "repo-one-name" {}

#Role ARN for CodeBuild
# variable "assume_role_arn" {}      #

# S3 bucket name for artifacts
# variable "artifact_bucket_name" {} # 

# CodeCommit repository name for source
#variable "code_commit_repository_one" {}    #

variable "code_deploy_app_name" {}

#variable "ec2_id" {}    #

variable "cd_app_name" {}

variable "deployment_group_one" {}   

variable "cicd_role_name" {}

# variable "cd_app_id" {}
