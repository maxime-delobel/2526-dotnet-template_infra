#!/bin/bash
set -euo pipefail
echo "Installing dependencies"
apt-get install -y git


echo "Cloning the repo"

echo "Building Docker image"
docker build -t rise-server -f ./deploy_docker/Dockerfile .

echo "Starting Docker container"
docker run -d \
    --name rise-server \
    -p 5001:5001 \
    rise-server

echo "Application started on port 5001"
