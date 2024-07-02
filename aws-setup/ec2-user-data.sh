#!/bin/bash

# Update all packages
sudo yum update -y

# Install SSM agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent

# Install Docker
sudo yum install docker -y
sudo systemctl start docker
sudo systemctl enable docker

# Install Nginx
sudo yum install nginx -y

# Configure Nginx
sudo bash -c 'cat <<EOT > /etc/nginx/conf.d/nodejsapp.conf
server {
    listen 80;

    server_name nodejsapp.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Host \$host;
    }
}
EOT'

# Start Nginx
sudo systemctl start nginx
sudo systemctl enable nginx