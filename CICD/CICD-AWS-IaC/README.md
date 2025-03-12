# AWS-CICD-DEMO
Purely AWS CICD DEMO

# MANUAL CREATION
aws s3api create-bucket --bucket my-we3-c02-artifact-and-logs-bucket-for-code-pipeline --region ap-south-1 --create-bucket-configuration LocationConstraint=ap-south-1

# DELETE
aws s3api delete-bucket --bucket my-we3-c02-artifact-and-logs-bucket-for-code-pipeline --region ap-south-1


# REMOVE MANUALLY
aws s3 rm s3://my-we3-c02-artifact-and-logs-bucket-for-code-pipeline --recursive

# CODEPIPELINE Theory
- Pipeline have Stages
- Stages have actions
- Actions have Name, Category, Owner, Provider
  Input_Artifacts, Output_Artifacts, Configuration and version
