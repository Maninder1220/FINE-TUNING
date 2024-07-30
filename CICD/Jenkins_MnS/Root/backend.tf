terraform {
  backend "s3" {
    bucket = "aws-backend-org"
    key = "terraform/state_file/here"
    region = "ap-south-1"
  }
}

