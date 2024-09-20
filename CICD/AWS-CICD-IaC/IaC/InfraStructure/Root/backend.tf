terraform {
  backend "s3" {
    bucket = "aws-backend-org"
    key = "terraform/state_file/Devops-User/AWS-CICD-TF/here"
    region = "ap-south-1"
  }
}

