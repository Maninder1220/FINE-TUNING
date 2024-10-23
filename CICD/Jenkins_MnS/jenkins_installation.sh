#!/bin/bash
set -e

# Update Package Lists
sudo apt full-upgrade -y &&

# Install Java
sudo apt install -y openjdk-21-jdk &&

# Update Package Lists
sudo apt full-upgrade -y &&

# Download Jenkins Key && Add Jenkins Repository
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

# Update Package Lists
sudo apt full-upgrade -y &&

# Install Jenkins
sudo apt install -y jenkins &&

# Start and Enable Jenkins Service
sudo systemctl start jenkins && sudo systemctl enable jenkins &&

# Check Jenkins Service Status
sudo systemctl status jenkins &&

# Check Java Version
java -version
