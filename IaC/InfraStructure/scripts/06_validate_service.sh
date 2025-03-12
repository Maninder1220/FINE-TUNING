#!/bin/bash
echo "Validating Terraform deployment..."
cd ~
cd WE3-C02-IaC/Root

# Validate the Terraform configuration
terraform validate

# Run a sample test or output checks
terraform output
