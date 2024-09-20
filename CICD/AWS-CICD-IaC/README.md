# CI/CD Pipeline with Infrastructure as Code (IaC)


# Challenge: 
Demonstrate a robust CI/CD pipeline using IaC principles while adhering to AWS Free Tier limitations.

# Solution:
- Use AWS CodeCommit for private code repositories.
- Employ AWS CodeBuild for building and testing the application.
- Leverage AWS CodePipeline to orchestrate the CI/CD process.
- Utilize AWS CloudFormation or AWS SAM for IaC / USING Terraform Instead.
- Integrate with AWS CodeDeploy for deployment to EC2 instances (be mindful of instance costs).
- Optimize build and test times to minimize costs.

# CodeCommit { Source Stage | SCM }
CodeCommit is a Git-based version control service where developers push code.
- TF TASK
Set up a CodeCommit repository.


# CodeBuild { Build Stage }
CodeBuild compiles source code, runs tests, and creates artifacts.
- TF TASK
Configure a CodeBuild project.

# CodeDeploy { Deployment Stage }
Automates deployments to EC2 instances or other deployment targets like Lambda or ECS.
- TF TASK
Configure CodeDeploy to deploy the built application to the target environment (e.g., EC2 instances).

# CodePipeline { CI/CD Orchestration }
It Orchestrates the CI/CD process by connecting the stages: 
- Source (CodeCommit), 
- Build (CodeBuild), and 
- Deploy (CodeDeploy).
- TF TASK
Set up a CodePipeline to tie together all stages.


# IAM ROLE

# S3

# Cloud Watch

