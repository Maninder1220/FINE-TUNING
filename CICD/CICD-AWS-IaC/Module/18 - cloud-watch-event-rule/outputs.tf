output "gh_event_rule_name" {
  value = aws_cloudwatch_event_rule.github_push.name
}

output "event_rule_trigger_gh_arn" {
  value = aws_cloudwatch_event_rule.github_push.arn
}