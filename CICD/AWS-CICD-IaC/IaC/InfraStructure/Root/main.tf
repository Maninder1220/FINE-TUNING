# # # # # NETWORKING # # # # #

# VPC
module "vpc" {
  source = "../Module/vpc"
  vpc_cider_block = var.vpc_cider_block
}

# AZ
module "az" {
  source = "../Module/availability_zone"
}


# SUBNETS
module "subnets" {
  source = "../Module/subnets"
  vpc_id = module.vpc.vpc_id
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
  random_az = module.az.random_az
}

# NAT GATEWAY
module "nat_gateway" {
  source = "../Module/nat_gateway"
  public_subnet_id = module.subnets.public_subnet_id
}


# INTERNET GATEWAY
module "internet_gateway" {
  source = "../Module/internet_gateway"
  vpc_id = module.vpc.vpc_id
}

# ROUTING
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


# NACL
module "nacl" {
  source = "../Module/nacl"
  vpc_id = module.vpc.vpc_id
  private_subnet_id = module.subnets.private_subnet_id
  public_subnet_id = module.subnets.public_subnet_id
}


# EC2 KEY PAIR
module "key_pair" {
  source = "../Module/ec2_keypair"
}

# EC2 - Public Subnet
module "ec2_instance" {
  source = "../Module/ec2"
  public_key = module.key_pair.public_key
  public_subnet_id = module.subnets.public_subnet_id
  sg_id = module.security_group.sg_id
}

# # # # # CICD # # # # # 

# IAM ROLE
module "iam_role" {
  source = "../Module/iam-role"
  cicd_role_name = var.cicd_role_name
}

# S3
module "s3" {
  source = "../Module/s3"
}


# CODE COMMIT
module "code_commit" {
  source = "../Module/code-commit"
  repo-one-name = var.repo-one-name
}

# CODE DEPLOY APP
module "code_deploy_app" {
  source = "../Module/code-deploy-app"
  code_deploy_app_name = var.code_deploy_app_name
  ec2_id = module.ec2_instance.ec2_id
}

# CODE DEPLOY GROUP
module "code_deploy_group" {
  source = "../Module/code-deploy-group"
  code_deploy_app_name = module.code_deploy_app.code_deploy_app_name
  deployment_group_one = var.deployment_group_one
  assume_role_arn = module.iam_role.assume_role_arn
  cd_app_id = module.code_deploy_app.cd_app_id
}

# CODE BUILD
module "code_build" {
  source = "../Module/code-build"
  assume_role_arn = module.iam_role.assume_role_arn
  artifact_bucket_name = module.s3.artifact_bucket_name
  code_commit_repository_one = module.code_commit.code_commit_repository_one
}



