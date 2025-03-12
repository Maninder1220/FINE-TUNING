resource "aws_codebuild_webhook" "cb_webhook" {
  project_name = var.codebuild_name

  filter_group {
    filter {
      type    = "EVENT"
      pattern = "PUSH"
    }
  }
}