#!/bin/bash

# Update Repos
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
sudo apt-get update -y

# Install apache
sudo apt install apache2 -y

# Install Stress
sudo apt-get install stress -y

# /var/www/html/index.html
sudo service apache2 stop
sudo rm /var/www/html/index.html
sudo touch /var/www/html/index.html

# HOSTNAME VAR
HOST=$(hostname)

# HELLO WORLD
cat <<EOT >> /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<style>
h1 {text-align: center;}
p {text-align: center;}
div {text-align: center;}
</style>
</head>
<body>
  <h1>Hello World.</h1>
  <p>Server Hostname: ${HOST}</p>
</body>
</html>
EOT

# Schedule Stress Job
sudo su -
sudo echo "*/30 * * * *  root    stress --cpu 1 --timeout 480" >> /etc/crontab

# Restart Services
sudo service apache2 start
sudo service cron reload
