
resource "aws_s3_bucket" "artifact_n_log_bucket" {
    bucket = "my-artifact-and-logs-bucket-for-code-pipeline" # Change to your desired bucket name
}

# Defining the folder structure in the bucket
/*
# Storing Artifacts
resource "aws_s3_object" "artifact_bucket_object" {
    bucket = aws_s3_bucket.artifact_n_log_bucket.id
    key    = "artifacts/my-artifact.zip" # it can be any file like jar, war, .. etc
    source = "artifacts/here/my-artifact.zip"
    acl    = "private"
    # etag = filemd5("artifacts/here/my-artifact.zip")
    depends_on = [ aws_s3_bucket.artifact_n_log_bucket ]
}

# Storing Logs
resource "aws_s3_object" "logs_bucket_object" {
    bucket = aws_s3_bucket.artifact_n_log_bucket.id
    key    = "logs/my-logs"
    source = "logs/here/my-logs"
    acl    = "private"
    # etag = filemd5("logs/here/my-logs")
    depends_on = [ aws_s3_bucket.artifact_n_log_bucket ]
}

# Storing Cache
resource "aws_s3_object" "cache_bucket_object" {
    bucket = aws_s3_bucket.artifact_n_log_bucket.id
    key    = "cache/my-cache"
    source = "cache/here/my-cache"
    acl    = "private"
    # etag = filemd5("cache/here/my-cache")
    depends_on = [ aws_s3_bucket.artifact_n_log_bucket ]  
}
*/

# Define the bucket policy to allow CodePipeline to access the bucket
resource "aws_s3_bucket_policy" "cicd_s3_policy" {
  bucket = aws_s3_bucket.artifact_n_log_bucket.id
  policy = data.aws_iam_policy_document.cicd_s3_policy.json
}

data "aws_iam_policy_document" "cicd_s3_policy" {
  statement {
    effect = "Allow"
    actions = [
      "s3:GetObject",
      "s3:GetObjectVersion",
      "s3:GetBucketVersioning",
      "s3:PutObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.artifact_n_log_bucket.arn,
      "${aws_s3_bucket.artifact_n_log_bucket.arn}/*"
    ]

    principals {
      type        = "Service"
      identifiers = [
        "codepipeline.amazonaws.com",
        "codebuild.amazonaws.com",
        "codedeploy.amazonaws.com"
        ]
    }
  }
  depends_on = [ aws_s3_bucket.artifact_n_log_bucket ]
}

