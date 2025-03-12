
resource "aws_cloudwatch_event_rule" "github_push" {
  name        = var.github-push-trigger
  description = "Trigger CodePipeline on GitHub push events"
  event_pattern = jsonencode({
    "source": ["aws.codestar"]
    "detail-type": ["CodeStar Source Connection Event"],
    "detail": {
      "repositoryName": ["AWS-Resource-Infra-PLANE"],
      "branchName": ["main"]
    }
  })
}
