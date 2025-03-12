resource "aws_codepipeline" "we3_co2_destroy_pipeline" {
  name     = var.pipeline_destroy_name
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

 # Manual Approval Stage
  stage {
    name = "Manual-Approval"

    action {
      name             = "Approve-Teardown"
      category         = "Approval"
      owner            = "AWS"
      provider         = "Manual"
      version          = "1"
      output_artifacts = []
      configuration = {
        CustomData = "Please approve the teardown"
      }
    }
  }


  # Destroy Stage
  stage {
    name = "Terra-Destroy"

    action {
      name            = "TF-Destroy"
      category        = "Build"
      owner           = "AWS"
      provider        = "CodeBuild"
      input_artifacts = ["github_source_output"]
      output_artifacts = ["tf_destroy_output"] 
      configuration = {
        ProjectName = var.codebuild_destroy_name
      }
      version = "1"
    }
  }

  depends_on = [ var.codebuld_project_bucket_arti_cach ]
}
