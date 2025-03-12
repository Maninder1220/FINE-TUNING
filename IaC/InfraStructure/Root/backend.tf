terraform {
  required_version = ">=1.10.5"
  backend "s3" {
    bucket = "my-aws-terraform-backend"
    key = "terraform/state_file/Devops-User/microservice/here"
    region = "ap-south-1"
  }
}

