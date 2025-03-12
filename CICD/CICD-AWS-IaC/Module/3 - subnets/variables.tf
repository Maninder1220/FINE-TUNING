# SUBNET
variable "public_subnet_cidr" {}

# VPC
variable "vpc_id" {}


# Random AZ
variable "selected_azs" {}


# TAG
variable "belongs_to" {
   type = string
   default = "WE3-CO2"
  }