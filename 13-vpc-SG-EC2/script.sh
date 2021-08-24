#!/bin/bash
sudo apt update -y

sudo apt install nginx -y

echo "nginx is installed"

sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

echo "installed dependent packages"

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update -y

echo "updated apt repositories"

sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo "installed docker package"

sudo usermod -aG docker ubuntu

echo "added ubuntu user to docker group"

# echo "Started Ansible installation"

# sudo apt-add-repository ppa:ansible/ansible

# sudo apt update -y

# sudo apt install ansible -y

# ansible --version

# echo "Ansible Installation Completed"