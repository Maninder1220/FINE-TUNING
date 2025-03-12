#!/bin/bash
echo "Cleaning up previous Terraform directories..."
rm -rf /opt/terraform-project/terraform.tfstate*
rm -rf /opt/terraform-project/.terraform
