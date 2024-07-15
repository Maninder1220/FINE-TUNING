# AWS PROVIDER

terraform {
  required_providers {
    aws = {
        version = "~>5.0"
        source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "ap-south-1"      # Mumbai
}

provider "aws" {
  alias = "Organization"
  region = "ap-south-1"
}