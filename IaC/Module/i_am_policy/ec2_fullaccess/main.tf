# Policy for ec2 Full Access
resource "aws_iam_policy" "ec2_full_access_policy" {
  policy = data.aws_iam_policy_document.ec2_full_access.json
}

# Policy Content
data "aws_iam_policy_document" "ec2_full_access" {
  statement {
    effect = "Allow" 
    actions = ["ec2:*"]
    resources = ["*"]
  }
}

