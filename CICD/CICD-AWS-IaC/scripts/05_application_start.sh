#!/bin/bash

echo "Applying Terraform configurations..."
cd /opt/terraform-project
terraform apply -auto-approve
