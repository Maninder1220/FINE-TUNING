terraform {
  backend "s3" {
    bucket = "aws-backend-org"
    key = "terraform/state_file/IAM/here"
    region = "ap-south-1"
  }
}

