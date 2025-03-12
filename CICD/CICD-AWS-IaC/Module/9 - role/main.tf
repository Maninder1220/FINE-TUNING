# INSTANCE PROFILE
resource "aws_iam_instance_profile" "instance_profile" {
  name = var.cicd_instance_profile_name
  role = aws_iam_role.assume_role.name
}


# ASSUMED ROLE
resource "aws_iam_role" "assume_role" {
  name = var.cicd_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
  description = "Role for This CICD Stack includes CodeBuild, CodeDeploy, CodePipeline, Event Bridge"
}


data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = [
        "codebuild.amazonaws.com",
        "codedeploy.amazonaws.com",
        "codepipeline.amazonaws.com",
        "events.amazonaws.com",
        "ec2.amazonaws.com",
        "lambda.amazonaws.com"
        
      ]
    }
  }
}

# NECESSARY AUTOMATION POLICIES FOR ASSUMED ROLE
# EC2 POLICY
resource "aws_iam_role_policy_attachment" "ec2_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.ec2_policy.arn
}

resource "aws_iam_policy" "ec2_policy" {
  name        = "my-ec2-policy"
  policy      = data.aws_iam_policy_document.ec2_policy.json
}

data "aws_iam_policy_document" "ec2_policy" {
  statement {
    effect = "Allow"
    actions = [
      "ec2:DescribeInstances",
      "ec2:DescribeInstanceStatus",
      "ec2:StartInstances",
      "ec2:StopInstances",
      "ec2:TerminateInstances",
      "ec2:DescribeRegions",
      "ec2:DescribeAvailabilityZones",
      "ec2:DescribeImages",
      "ec2:CreateTags",
      "ec2:DescribeTags",
      "ec2:ImportKeyPair",
      "ec2:DescribeKeyPairs",
      "ec2:DeleteKeyPair",
      "ec2:AllocateAddress",
      "ec2:ReleaseAddress",
      "ec2:DescribeAddresses",
      "ec2:DescribeAddressesAttribute",
      "ec2:DescribeVpcs",
      "ec2:CreateVpc",
      "ec2:DeleteVpc",
      "ec2:DescribeVpcAttribute",
      "ec2:ModifyVpcAttribute",
      "ec2:DescribeSubnets",
      "ec2:CreateSubnet",
      "ec2:DeleteSubnet",
      "ec2:ModifySubnetAttribute",
      "ec2:DescribeInternetGateways",
      "ec2:CreateInternetGateway",
      "ec2:AttachInternetGateway",
      "ec2:DetachInternetGateway",
      "ec2:DeleteInternetGateway",
      "ec2:CreateNatGateway",
      "ec2:DescribeNatGateways",
      "ec2:DeleteNatGateway",
      "ec2:DescribeRouteTables",
      "ec2:CreateRouteTable",
      "ec2:AssociateRouteTable",
      "ec2:DisassociateRouteTable",
      "ec2:DeleteRouteTable",
      "ec2:CreateRoute",
      "ec2:DeleteRoute",
      "ec2:DescribeSecurityGroups",
      "ec2:CreateSecurityGroup",
      "ec2:DescribeSecurityGroupRules",
      "ec2:RevokeSecurityGroupIngress",
      "ec2:RevokeSecurityGroupEgress",
      "ec2:AuthorizeSecurityGroupIngress",
      "ec2:AuthorizeSecurityGroupEgress",
      "ec2:DeleteSecurityGroup",
      "ec2:CreateNetworkAcl",
      "ec2:DescribeNetworkAcls",
      "ec2:DeleteNetworkAcl",
      "ec2:ReplaceNetworkAclAssociation",
      "ec2:CreateNetworkAclEntry",
      "ec2:DeleteNetworkAclEntry",
      "ec2:DescribeNetworkInterfaces",
      "ec2:CreateNetworkInterface",
      "ec2:DeleteNetworkInterface",
      "ec2:DescribeNetworkInterfaceAttribute",
      "ec2:ModifyNetworkInterfaceAttribute",
      "ec2:AttachNetworkInterface",
      "ec2:DetachNetworkInterface",
      "ec2:CreateNetworkInterfacePermission",
      "ec2:DeleteNetworkInterfacePermission",
      "ec2:DescribeNetworkInterfacePermissions",
      "ec2:RunInstances",
      "ec2:DescribeInstanceTypes",
      "ec2:DescribeInstanceAttribute",
      "ec2:ModifyInstanceAttribute",
      "ec2:DescribeVolumes",
      "ec2:CreateVolume",
      "ec2:DeleteVolume",
      "ec2:ModifyVolume",
      "ec2:AttachVolume",
      "ec2:DetachVolume",
      "ec2:DescribeVolumeStatus",
      "ec2:EnableVolumeIO",
      "ec2:DescribeInstanceCreditSpecifications",
      "ec2:CreateInstanceConnectEndpoint",
      "ec2:DescribeInstanceConnectEndpoints",
      "ec2:DeleteInstanceConnectEndpoint",
      "ec2:DisassociateAddress"

       
    ]

    resources = ["*"] 
  }
}

# S3 POLICY
resource "aws_iam_role_policy_attachment" "s3_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.s3_policy.arn
}

resource "aws_iam_policy" "s3_policy" {
  name        = "my-s3-policy"
  policy      = data.aws_iam_policy_document.s3_policy.json
}

data "aws_iam_policy_document" "s3_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:PutObject",
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObjectAcl",
      "s3:PutObject",
      "s3:ListBucket"
    ]
    resources = ["*"] 
  }
}

# CODE STAR POLICY
resource "aws_iam_role_policy_attachment" "code_star_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.code_star_policy.arn
}

resource "aws_iam_policy" "code_star_policy" {
  name        = "my-code-star-policy"
  policy      = data.aws_iam_policy_document.code_star_policy.json
}

data "aws_iam_policy_document" "code_star_policy" {
  statement {
    effect = "Allow"
    actions = [
      "codestar-connections:CreateConnection",
      "codestar-connections:ListConnections",
      "codestar-connections:UpdateConnection",
      "codestar-connections:GetConnection",
      "codestar-connections:UseConnection"
      
    ]

    resources = ["*"] 
  }
}


# CODE BUILD POLICY
resource "aws_iam_role_policy_attachment" "code_build_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.code_build_policy.arn
}

resource "aws_iam_policy" "code_build_policy" {
  name        = "my-code-build-policy"
  policy      = data.aws_iam_policy_document.code_build_policy.json
}

data "aws_iam_policy_document" "code_build_policy" {
  statement {
    effect = "Allow"
    actions = [
      "codebuild:StartBuild",
      "codebuild:BatchGetBuilds",
      "codebuild:CreateWebhook"
      
    ]

    resources = ["*"] 
  }
}


# CODE DEPLOY POLICY
resource "aws_iam_role_policy_attachment" "code_deploy_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.code_deploy_policy.arn
}

resource "aws_iam_policy" "code_deploy_policy" {
  name        = "my-code-deploy-policy"
  policy      = data.aws_iam_policy_document.code_deploy_policy.json
}

data "aws_iam_policy_document" "code_deploy_policy" {
  statement {
    effect = "Allow"
    actions = [
      "codedeploy:RegisterApplicationRevision",
      "codedeploy:GetDeployment",
      "codedeploy:GetApplication",
      "codedeploy:CreateDeployment",
      "codedeploy:GetDeploymentConfig",
      "codedeploy:GetApplicationRevision",
    ]

    resources = ["*"] 
  }
}


# CODE PIPELINE POLICY
resource "aws_iam_role_policy_attachment" "code_pipeline_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.code_pipeline_policy.arn
}

resource "aws_iam_policy" "code_pipeline_policy" {
  name        = "my-code-pipeline-policy"
  policy      = data.aws_iam_policy_document.code_pipeline_policy.json
}

data "aws_iam_policy_document" "code_pipeline_policy" {
  statement {
    effect = "Allow"
    actions = [
      "codepipeline:StartPipelineExecution",
    ]

    resources = ["*"] 
  }
}

# LOG POLICY
resource "aws_iam_role_policy_attachment" "logs_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.logs_policy.arn
}

resource "aws_iam_policy" "logs_policy" {
  name        = "my-logs-policy"
  policy      = data.aws_iam_policy_document.log_permissions_policy.json
}

data "aws_iam_policy_document" "log_permissions_policy" {
  statement {
    effect = "Allow"
    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]

    resources = ["*"] 
  }
}
/*
# LAMBDA POLICY
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.assume_role.name
  policy_arn = aws_iam_policy.lambda_policy.arn
}

resource "aws_iam_policy" "lambda_policy" {
  name        = "my-lambda-policy"
  policy      = data.aws_iam_policy_document.lambda_permissions_policy.json
}

data "aws_iam_policy_document" "lambda_permissions_policy" {
  statement {
    effect = "Allow"
    actions = [
      "lambda:InvokeFunction",
    ]

    resources = ["*"] 
  }
}
*/