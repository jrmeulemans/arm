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