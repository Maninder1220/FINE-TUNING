# Creating EC2 for Jenkins Server

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}


resource "aws_instance" "jenkins_server" {
  instance_type = "t2.micro"
  ami = data.aws_ami.ubuntu.id
  key_name = var.public_key           
  security_groups = [ var.sg_id ]
  availability_zone = var.inherit_public_subnet_az     
  associate_public_ip_address = true
  subnet_id = var.public_subnet_id
  user_data = file("${path.module}/git_install.sh")      # CHECK IF INSTALLED
}