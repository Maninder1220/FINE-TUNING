# Update Package Lists
sudo apt update

# Install Java 
sudo apt install -y openjdk-21-jdk

# Update Package Lists
sudo apt update


# Download Jenkins Key
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc]" \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

sudo apt update

# Install Jenkins
sudo apt install -y jenkins

# Start n Enable Jenkins Service
sudo systemctl enable jenkins
sudo systemctl start jenkins


# Check Java Version
java -version
