# VPC CIDER
variable "vpc_cider_block" {}

# SUBNET
# Private
variable "pri_sub_one" {}    # CIDR_RANGE
variable "pri_sub_two" {}    # CIDR_RANGE

# Public
variable "pub_sub_one" {}     # CIDR_RANGE
variable "pub_sub_two" {}     # CIDR_RANGE
variable "pub_sub_three" {}     # CIDR_RANGE
variable "pub_sub_four" {}     # CIDR_RANGE

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
