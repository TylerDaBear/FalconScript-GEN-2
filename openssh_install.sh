#!/bin/bash

# Install OpenSSH client
sudo apt-get update
sudo apt-get install openssh-client -y

# Start the OpenSSH client service
sudo systemctl start ssh

# Enable the OpenSSH client service to start on boot
sudo systemctl enable ssh

sudo apt-get install net-tools
