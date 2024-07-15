# VPC
module "vpc" {
  source = "../Module/vpc"
  vpc_cider_block = var.vpc_cider_block
}

module "subnets" {
  source = "../Module/subnets"
  vpc_id = module.vpc.vpc_id
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
}

module "nat_gateway" {
  source = "../Module/nat_gateway"
  public_subnet_id = module.subnets.public_subnet_id
}

module "internet_gateway" {
  source = "../Module/internet_gateway"
  vpc_id = module.vpc.vpc_id
}


module "routing" {
  source = "../Module/routing"

  vpc_id = module.vpc.vpc_id
  private_destination_cider = var.private_destination_cider
  public_destination_cider =  var.public_destination_cider
  public_subnet_id = module.subnets.public_subnet_id
  private_subnet_id = module.subnets.private_subnet_id
  nat_gateway_id = module.nat_gateway.nat_gateway_id
  ig_id = module.internet_gateway.ig_id
 }

# SECURITY GROUP
module "security_group" {
  source = "../Module/security_group"
  vpc_id = module.vpc.vpc_id
}

