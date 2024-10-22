# Private Subnet - pri_sub_one | pri_sub_two
output "pri_sub_one_id" {
  value = aws_subnet.pri_sub_one.id
}

output "pri_sub_two_id" {
  value = aws_subnet.pri_sub_two.id
}


# Public Subnet - pub_sub_one | pub_sub_two | pub_sub_three | pub_sub_four
output "pub_sub_one_id" {
  value = aws_subnet.pub_sub_one.id
}

output "pub_sub_two_id" {
  value = aws_subnet.pub_sub_one.id
}

output "pub_sub_three_id" {
  value = aws_subnet.pub_sub_one.id
}

output "pub_sub_four_id" {
  value = aws_subnet.pub_sub_one.id
}

