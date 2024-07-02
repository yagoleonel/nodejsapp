#!/bin/bash

# Login to Docker Hub using an access token
DOCKERHUB_USERNAME="<dh_username>"
DOCKERHUB_TOKEN="<dh_token>"
echo "$DOCKERHUB_TOKEN" | sudo docker login -u "$DOCKERHUB_USERNAME" --password-stdin

# Stop current container
sudo docker stop nodejsapp
sudo docker rm nodejsapp

# Pull the Docker image from Docker Hub
sudo docker pull <dh_username>/nodejsapp:latest

# Run the Docker container
sudo docker run -d --name nodejsapp -p 3000:3000 <dh_username>/nodejsapp:latest
