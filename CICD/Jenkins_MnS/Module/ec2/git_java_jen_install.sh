#!/bin/bash

# Update package lists
sudo apt update

# Install Git
sudo apt install -y git

# Install Java 
sudo apt install -y openjdk-21-jdk

# Install Jenkins

# Add Repo Key
sudo wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo gpg --dearmor -o /usr/share/keyrings/jenkins.gpg

# Add Repo
sudo sh -c 'echo deb [signed-by=/usr/share/keyrings/jenkins.gpg] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list'

# Update package lists
sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start and enable Jenkins service
sudo systemctl start jenkins
sudo systemctl enable jenkins

# Check Java version
java -version

echo "Java and Jenkins installation complete!"

# Verify Git installation
git --version

echo "Git installation complete!"
