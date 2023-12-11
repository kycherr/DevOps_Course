#!/bin/bash
sudo apt install sshpass -y
sudo apt autoremove -v

echo "--- Installing Docker ---"
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker vagrant

echo "--- Install Docker Compose ---"
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "--- Run Nginx container and forward ports ---"
sudo docker run -d -p 80:80 --name nginx-container nginx
