
# IAM USER
module "iam" {
  source = "../Module/iam"
  username    = var.username
  policy_name = var.policy_name
}



