# Installing LogStash

# Download and install the Public Signing Key:
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo gpg --dearmor -o /usr/share/keyrings/elastic-keyring.gpg

# Install the apt-transport-https package
sudo apt-get install apt-transport-https

# Save the repository definition to /etc/apt/sources.list.d/elastic-8.x.list:
echo "deb [signed-by=/usr/share/keyrings/elastic-keyring.gpg] https://artifacts.elastic.co/packages/8.x/apt stable main" | sudo tee -a /etc/apt/sources.list.d/elastic-8.x.list

# Update
sudo apt update


# Installing LogStash
sudo apt install logstash


# START LOGSTASH
sudo systemctl start logstash.service




# CHECK LOGSTASH
# sudo systemctl status logstash.service


# STOP LOG STASH
# sudo systemctl stop logstash.service
