terraform {
  backend "s3" {
    bucket = "my-aws-terraform-backend"
    key = "terraform/state_file/Devops-User/WE3-CO2/here"
    region = "ap-south-1"
  }
}