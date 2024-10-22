
# # # # # SUBNETS # # # # # 

# Private Subnet

# Subnet : pri_sub_one
resource "aws_subnet" "pri_sub_one" {
  vpc_id = var.vpc_id
  cidr_block = var.pri_sub_one
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Private-Subnet"
  }
}

# Subnet : pri_sub_two
resource "aws_subnet" "pri_sub_two" {
  vpc_id = var.vpc_id
  cidr_block = var.pri_sub_two
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Private-Subnet"
  }
}



# Public Subnet

# Subnet : pub_sub_one
resource "aws_subnet" "pub_sub_one" {
  vpc_id = var.vpc_id
  cidr_block = var.pub_sub_one
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }
}

# Subnet : pub_sub_two
resource "aws_subnet" "pub_sub_two" {
  vpc_id = var.vpc_id
  cidr_block = var.pub_sub_two
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }
}


# Subnet : pub_sub_three
resource "aws_subnet" "pub_sub_three" {
  vpc_id = var.vpc_id
  cidr_block = var.pub_sub_three
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }
}


# Subnet : pub_sub_four
resource "aws_subnet" "pub_sub_four" {
  vpc_id = var.vpc_id
  cidr_block = var.pub_sub_four
  availability_zone = var.random_az
  map_public_ip_on_launch = true

tags = {
    Name = "${var.belongs_to}-Public-Subnet"
  }
}



