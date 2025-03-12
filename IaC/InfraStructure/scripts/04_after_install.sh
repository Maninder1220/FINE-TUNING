#!/bin/bash

set -e

echo "Installing Terraform..."
TERRAFORM_VERSION="1.10.5"  # Specify the version you want to install
TERRAFORM_ZIP="terraform_${TERRAFORM_VERSION}_linux_amd64.zip"
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/${TERRAFORM_ZIP}
unzip ${TERRAFORM_ZIP}
mv terraform /usr/local/bin/
rm ${TERRAFORM_ZIP}


echo "Terraform installation complete."


