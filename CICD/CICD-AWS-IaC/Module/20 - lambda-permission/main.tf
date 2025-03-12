resource "aws_lambda_permission" "allow_eventbridge" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = var.gh_lam_function_name
  principal     = "events.amazonaws.com"
  source_arn    = var.event_rule_trigger_gh_arn
}