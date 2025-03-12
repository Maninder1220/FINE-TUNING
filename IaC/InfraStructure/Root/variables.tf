# VPC CIDER
variable "vpc_cider_block" {
    type = string
}

# SUBNET
variable "private_subnet" {
    type = string
}
variable "public_subnet" {
    type = string
}

# Public CIDR
variable "public_destination_cider" {
    type = string
}
variable "private_destination_cider" {
    type = string
}

/*
# Region
variable "region" {
    type = string
}
*/


