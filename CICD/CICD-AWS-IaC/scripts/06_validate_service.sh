#!/bin/bash
echo "Validating Terraform deployment..."
cd /opt/terraform-project

# Validate the Terraform configuration
terraform validate

# Run a sample test or output checks
terraform output
