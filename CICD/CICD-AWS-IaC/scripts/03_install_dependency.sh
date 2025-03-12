#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

echo "Installing dependencies for Terraform..."
apt update -y
apt install -y unzip curl

# Install Terraform
TERRAFORM_VERSION="1.10.5"  # Adjust as needed
curl -O https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /usr/local/bin/
rm terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Verify installation
terraform -version
