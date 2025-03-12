# # # # NETWORKING STACK # # # #

# VPC
module "vpc" {
  source          = "../Module/1 - vpc"
  vpc_cider_block = var.vpc_cider_block
  codebuld_project_bucket_arti_cach = module.s3.codebuld_project_bucket_arti_cach
}

# Availability Zones
module "az" {
  source          = "../Module/2 - availability-zone"
}

# Subnets
module "subnets" {
  source              = "../Module/3 - subnets"
  selected_azs        = module.az.selected_azs
  vpc_id              = module.vpc.vpc_id
  public_subnet_cidr  = var.public_subnet_cidr 
}

# Security Groups
module "security-group" {
  source = "../Module/4 - security-group"
  vpc_id = module.vpc.vpc_id
}

# Internet Gateway
module "ig" {
  source = "../Module/5 - internet-gateway"
  vpc_id = module.vpc.vpc_id
}

# ROUTING
module "routing" {
  source = "../Module/6 - routing"
  vpc_id = module.vpc.vpc_id
  ig_id = module.ig.ig_id
  public_destination_cider = var.public_destination_cider
  public_subnet_id = module.subnets.public_subnet_id
}

# NACL
module "nacl" {
  source = "../Module/7 - nacl"
  vpc_id = module.vpc.vpc_id
  public_subnet_id = module.subnets.public_subnet_id
}

# # # # SERVICES OF CICD STACK # # # #

# S3
module "s3" {
  source = "../Module/8 - s3"
}

# ROLE
module "assume-role" {
  source = "../Module/9 - role"
  cicd_role_name = var.cicd_role_name
  cicd_instance_profile_name = var.cicd_instance_profile_name
}

# EC2 Key Pair
module "ec2-key-pair" {
  source = "../Module/10 - ec2-key-pair"
}

# EC2 Instance
module "ec2" {
  source = "../Module/11 - ec2"
  sg_id = module.security-group.sg_id
  selected_azs = module.az.selected_azs  
  public_subnet_id = module.subnets.public_subnet_id
  public_key = module.ec2-key-pair.public_key
  assume_role_arn = module.assume-role.assume_role_arn
  instance_profile_name = module.assume-role.instance_profile_name
}

# # # # CICD STACK # # # #

# CODE SOURCE
module "code-star-connect" {
  source = "../Module/12 - code-star-connect"
}

# CODE BUILD
module "code-build" {
  source = "../Module/13 - code-build"
  assume_role_arn = module.assume-role.assume_role_arn
  codebuld_project_bucket_arti_cach = module.s3.codebuld_project_bucket_arti_cach
  gh_token = var.gh_token
}

# CODE DEPLOY APP
module "code-deploy-app" {
  source = "../Module/14 - code-deploy-app"
  code_deploy_app_name = var.code_deploy_app_name
  ec2_id = module.ec2.ec2_id
}

# CODE DEPLOY GROUP
module "code-deploy-group" {
  source = "../Module/15 - code-deploy-group"
  assume_role_arn = module.assume-role.assume_role_arn
  code_deploy_app_name = module.code-deploy-app.code_deploy_app_name
  deployment_group_one = var.deployment_group_one
  cd_app_id = module.code-deploy-app.cd_app_id
}


# CODE PIPELINE
module "code-pipeline" {
  source = "../Module/16 - code-pipeline"
  assume_role_arn = module.assume-role.assume_role_arn
  codebuld_project_bucket_arti_cach = module.s3.codebuld_project_bucket_arti_cach
  pipeline_name = var.pipeline_name
  codebuild_name = module.code-build.codebuild_name
  code_deploy_app_name = module.code-deploy-app.code_deploy_app_name
  deployment_group_name = module.code-deploy-group.deployment_group_name
  codestar_arn = module.code-star-connect.codestar_arn
  github_repository_name = var.github_repository_name
}

# Cloud Watch | Log Group
module "cloud-watch-log-group" {
  source = "../Module/17 - cloud-watch-log-group"
}

# Event Bridge Rule
module "event-rule" {
  source = "../Module/18 - cloud-watch-event-rule"
  github-push-trigger = var.github-push-trigger
}

# Event Bridge Target
module "event-target" {
  source = "../Module/19 - cloud-watch-event-target"
  gh_event_rule_name = module.event-rule.gh_event_rule_name
  code_pipeline_arn = module.code-pipeline.code_pipeline_arn
  assume_role_arn = module.assume-role.assume_role_arn
}

# DESTRUCTION STARTS HERE
module "code-build-destroy" {
  source = "../Module/25 - code-build-destroy"
  gh_token = var.gh_token
  assume_role_arn = module.assume-role.assume_role_arn
  codebuld_project_bucket_arti_cach = module.s3.codebuld_project_bucket_arti_cach
}

module "code-deploy-app-destroy" {
  source = "../Module/24 - cd-app-destroy"
  code_deploy_destroy_app_name = var.code_deploy_destroy_app_name
  ec2_id = module.ec2.ec2_id
}

module "code-pipeline-destroy" {
  source = "../Module/23 - code-pipeline-destroy"
  code_deploy_app_name = module.code-deploy-app.code_deploy_app_name
  assume_role_arn = module.assume-role.assume_role_arn
  codebuld_project_bucket_arti_cach = module.s3.codebuld_project_bucket_arti_cach
  codestar_arn = module.code-star-connect.codestar_arn
  github_repository_name = var.github_repository_name
  deployment_group_name = module.code-deploy-group.deployment_group_name
  codebuild_destroy_name = module.code-build-destroy.codebuild_destroy_name
  pipeline_destroy_name = var.pipeline_destroy_name
}



/*
# WEBHOOK
module "cb-webhook"{
  source = "../Module/22 - webhook-cb"
  codebuild_name = module.code-build.codebuild_name
}


# LAMBDA PERMISSION
module "lambda-permission" {
  source = "../Module/20 - lambda-permission"
  event_rule_trigger_gh_arn = module.event-rule.event_rule_trigger_gh_arn
  gh_lam_function_name = module.lambda-function.gh_lam_function_name
}

# LAMBDA FUNCTION
module "lambda-function" {
  source = "../Module/21 - lambda-function"
  assume_role_arn = module.assume-role.assume_role_arn
}

*/

