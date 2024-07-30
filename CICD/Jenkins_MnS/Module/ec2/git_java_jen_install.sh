#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install git -y

# Update package lists
sudo apt update

# Install Java 
sudo apt install openjdk-21-jdk

# Update Package Lists
sudo apt update

##########################################

# Install Jenkins

# Add Repo Key
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.


# Add Repo
sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list'

# Update Package Lists
sudo apt update


# Install Jenkins
sudo apt install jenkins

# Start n Enable Jenkins Service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Java Version
java -version

echo "Java n Jenkins installation complete!"

# Verify installation
git --version

echo "Git installation complete!"