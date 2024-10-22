
# # # # # SUBNETS # # # # # 

# Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.private_subnet_cidr
  availability_zone = var.selected_azs[0]
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Private-Subnet"
  }

}

# Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id = var.vpc_id
  cidr_block = var.public_subnet_cidr
  availability_zone = var.selected_azs[1]
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }

}