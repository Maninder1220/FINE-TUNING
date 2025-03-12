resource "aws_codebuild_project" "my_destroy_build" {
  name          = "WE3-CO2-Destroy"       # Change Name
  service_role  = var.assume_role_arn
  build_timeout   = "5"           # 5 minutes

    # Artifacts is where the build output is stored
    artifacts {
        type = "S3"
        location = var.codebuld_project_bucket_arti_cach
        path = "artifacts/"
        name = "my-artifacts.zip"
    }

    # Cache is where the build cache is stored
    cache {
        type = "S3"
        location = var.codebuld_project_bucket_arti_cach
    }

    # Environment is the build environment
    environment {
        compute_type                = "BUILD_GENERAL1_SMALL"        # 3GB 2vCPU
        image                       = "aws/codebuild/standard:4.0"  # Can add Docker image here
        type                        = "LINUX_CONTAINER"      
    }


    # Source is where the source code is stored
    source {
    type            = "GITHUB"
    location        = "https://github.com/Maninder1220/AWS-Resource-Infra-PLANE.git"
    git_clone_depth = 1
    buildspec = "buildspec-destroy.yml"
    
    
    git_submodules_config {
    fetch_submodules = false # Set to true if you want to include submodules
  }
  }

    

    # Logs is where the build logs are stored
    logs_config {
        cloudwatch_logs {
            group_name  = "/aws/codebuild/my-build"
            stream_name = "my-build"
        }
    } 
    
    depends_on = [ var.codebuld_project_bucket_arti_cach ]
}