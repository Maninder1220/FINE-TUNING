output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
}


output "inherit_az_public_subnet" {
  value = aws_subnet.public_subnet.availability_zone
}