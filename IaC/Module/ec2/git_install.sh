#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install git -y

# Verify installation
git --version

echo "Git installation complete!"