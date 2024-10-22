# SUBNET
# Private
variable "pri_sub_one" {}    # CIDR_RANGE
variable "pri_sub_two" {}    # CIDR_RANGE

# Public
variable "pub_sub_one" {}     # CIDR_RANGE
variable "pub_sub_two" {}     # CIDR_RANGE
variable "pub_sub_three" {}     # CIDR_RANGE
variable "pub_sub_four" {}     # CIDR_RANGE

# VPC
variable "vpc_id" {}


# Random AZ
variable "random_az" {}


# TAG
variable "belongs_to" {
   type = string
   default = "3T-Infra"
  }