# code deploy application
resource "aws_codedeploy_app" "destroy_app" {
  compute_platform = "Server"   # ECS or Lambda - Need Clarity Here
  name             = var.code_deploy_destroy_app_name
  depends_on = [ var.ec2_id ]

  tags = {
    Name = "${var.belongs_to}-codedeploy-app"
  }
}