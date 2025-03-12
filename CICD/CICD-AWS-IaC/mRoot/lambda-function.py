import boto3
import json
import requests

def get_latest_commit(owner, repo, branch='main'):
    url = f"https://api.github.com/repos/{owner}/{repo}/commits/{branch}"
    response = requests.get(url)
    response.raise_for_status()
    commit_data = response.json()
    return commit_data['sha']

def lambda_handler(event, context):
    # Initialize the CodePipeline client
    codepipeline_client = boto3.client('codepipeline')

    # Extract pipeline name (replace with your pipeline name)
    pipeline_name = "we3-c02-pipeline"  # Replace with your pipeline name

    # GitHub repository details
    github_owner = "Maninder1220"  # Replace with your GitHub username
    github_repo = "WE3-C02-IaC"  # Replace with your repository name
    github_branch = "main"  # Replace with your branch name if different

    try:
        # List the recent pipeline executions (to check if it was failed or not run)
        response = codepipeline_client.list_pipeline_executions(
            pipelineName=pipeline_name,
            maxResults=1
        )

        # Get the status of the most recent execution
        if 'pipelineExecutionSummaries' in response and len(response['pipelineExecutionSummaries']) > 0:
            latest_execution = response['pipelineExecutionSummaries'][0]
            status = latest_execution['status']
        else:
            # No executions, the pipeline hasn't run yet.
            status = 'NOT_EXECUTED'

        # If the pipeline is failed or has never executed, check for new commits
        if status == 'FAILED' or status == 'NOT_EXECUTED':
            latest_commit = get_latest_commit(github_owner, github_repo, github_branch)
            if latest_commit != latest_execution.get('sourceRevisions', [{}])[0].get('revisionId', ''):
                response = codepipeline_client.start_pipeline_execution(
                    name=pipeline_name
                )
                return {
                    "statusCode": 200,
                    "body": json.dumps(f"Pipeline {pipeline_name} execution started successfully due to new commit.")
                }
            else:
                return {
                    "statusCode": 200,
                    "body": json.dumps(f"No new commits found. Pipeline {pipeline_name} execution not started.")
                }
        else:
            # If pipeline is already successful or in progress, skip starting it
            return {
                "statusCode": 200,
                "body": json.dumps(f"Pipeline {pipeline_name} is already running or was successful. Skipping execution.")
            }
    except Exception as e:
        return {
            "statusCode": 500,
            "body": json.dumps(f"Failed to start pipeline execution: {str(e)}")
        }
