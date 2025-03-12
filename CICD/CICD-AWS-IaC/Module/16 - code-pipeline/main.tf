resource "aws_codepipeline" "we3_co2_pipeline" {
  name     = var.pipeline_name
  role_arn = var.assume_role_arn

  artifact_store {
    type     = "S3"
    location = var.codebuld_project_bucket_arti_cach
  }

  # Source Stage for GitHub
stage {
  name = "GitHub-Source"

  action {
    name             = "GitHub_Source"
    category         = "Source"
    owner            = "AWS"
    provider         = "CodeStarSourceConnection"        # Change to GitHub
    version          = "1"
    output_artifacts = ["github_source_output"]
    configuration = {
        ConnectionArn    = var.codestar_arn
        FullRepositoryId = var.github_repository_name
        BranchName       = "main"
        DetectChanges    = "true"
      }
  }
}
  # Build Stage
  stage {
    name = "CodeBuild-Build"

    action {
      name            = "CB_Build"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["github_source_output"]
      output_artifacts = ["cb_build_output"] 
      configuration = {
        ProjectName = var.codebuild_name
      }
      version = "1"
    }
  }

  # Deploy Stage
  stage {
    name = "CodeDeploy-Deploy"

    action {
      name            = "CD_Deploy"
      category        = "Deploy"
      owner           = "AWS"
      provider        = "CodeDeploy"
      input_artifacts = ["cb_build_output"]
      configuration = {
        ApplicationName     = var.code_deploy_app_name
        DeploymentGroupName = var.deployment_group_name
      }

      version = "1"
    }
  }
  depends_on = [ var.codebuld_project_bucket_arti_cach ]
}
