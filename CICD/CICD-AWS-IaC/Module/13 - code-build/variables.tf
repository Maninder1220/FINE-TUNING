#Role ARN for CodeBuild
variable "assume_role_arn" {}

# S3 bucket name for artifacts
variable "codebuld_project_bucket_arti_cach" {}

# Github Token
variable "gh_token" {
  sensitive = true
}