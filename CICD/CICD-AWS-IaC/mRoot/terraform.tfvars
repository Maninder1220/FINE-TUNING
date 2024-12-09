# VPC CIDER
vpc_cider_block = "10.0.0.0/16"

# SUBNET CIDR
private_subnet_cidr = "10.0.1.0/24"
public_subnet_cidr = "10.0.2.0/24"

# CIDR FOR NAT ROUTING
public_destination_cider = "0.0.0.0/0"
private_destination_cider = "0.0.0.0/0"

# CIDR ROLE NAME
cicd_role_name = "live-cicd-role"

# CODE COMMIT REPO NAME
repo-one-name = "live-repo-one"

# CODE DEPLOY APP NAME
code_deploy_app_name = "live-code-deploy-app"

# CODE DEPLOY GROUP NAME
deployment_group_one = "live-deployment-group-one"

# CODE PIPELINE NAME
pipeline_name = "live-pipeline"

# CODE PIPELINE TRIGGER NAME
cc_trigger_codepipeline = "live-code-commit-trigger"

# INSTANCE PROFILE NAME
cicd_instance_profile_name = "live-cicd-instance-profile"