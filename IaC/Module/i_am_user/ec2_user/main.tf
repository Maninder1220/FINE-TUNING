# User for Creating EC2 for jenkins server

resource "aws_iam_user" "ec2_access" {
  name = "ec2_user"
}

resource "aws_iam_access_key" "ec2_access_key" {
  user = aws_iam_user.ec2_access.name
}

resource "aws_iam_user_policy" "fullaccess_ec2" {
  user = aws_iam_user.ec2_access.id
  policy = var.ec2_full_access_policy
}