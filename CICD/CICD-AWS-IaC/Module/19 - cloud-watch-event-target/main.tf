
resource "aws_cloudwatch_event_target" "codepipeline_target" {
  rule      = var.gh_event_rule_name
  arn       = var.code_pipeline_arn
  role_arn  = var.assume_role_arn
}