output "code_deploy_destroy_app_name" {
    value = aws_codedeploy_app.destroy_app.name
}

output "cd_destroy_app_id" {
    value = aws_codedeploy_app.destroy_app.id
}