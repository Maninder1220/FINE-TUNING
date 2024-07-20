output "ec2_fullAccess_user" {
  value = aws_iam_user.ec2_access.id
}