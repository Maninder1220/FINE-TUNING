resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cider_block
  instance_tenancy = "default"   # Shared tenancy model

  tags = {
    Name = "${var.belongs_to}-vpc"
  }

    depends_on = [ var.codebuld_project_bucket_arti_cach ]

}