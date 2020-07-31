#!/bin/bash

# Update Repos
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
sudo apt-add-repository https://packages.microsoft.com/ubuntu/18.04/prod
sudo apt-get update && sudo apt-get upgrade -y

# Install ClamAV
sudo apt-get install clamav -y

# Install Blobfuse (mount blob storage)
sudo apt-get install blobfuse -y

# Create temp path for open files (with sftp account)
sudo mkdir /mnt/resource/blobfusetmp -p
sudo chown sftp /mnt/resource/blobfusetmp

# Install .net core runtime
sudo apt-get install -y apt-transport-https && \
sudo apt-get update && \
sudo apt-get install -y aspnetcore-runtime-3.1

# Create /sftp directory
sudo mkdir /sftp

# Create blobfuse.service config file

VAR1=""
sudo wget https://raw.githubusercontent.com/jrmeulemans/arm/master/blobfuse.service
sudo sed -i 's+PARAM1+/sftp+g' blobfuse.service
sudo sed -i 's+PARAM2+sftp+g' blobfuse.service
sudo sed -i 's+PARAM3+sftp0001+g' blobfuse.service
sudo sed -i "s/PARAM4/$VAR1/g" blobfuse.service

# Set up systemd
sudo cp blobfuse.service /etc/systemd/system
sudo systemctl daemon-reload
sudo systemctl start blobfuse.service
