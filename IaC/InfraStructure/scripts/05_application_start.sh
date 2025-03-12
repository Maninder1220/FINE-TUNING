#!/bin/bash

set -e

echo "Initializing Terraform..."
cd ~
git clone https://github.com/Maninder1220/WE3-C02-IaC.git
cd WE3-C02-IaC/Root
terraform init


echo "Applying Terraform configurations..."

terraform apply -auto-approve
