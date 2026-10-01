#!/bin/bash
set -euo pipefail
echo "Installing dependencies"
apt-get install -y git


echo "Cloning the repo"
cd /
if [ ! -d /2526-dotnet-template ]; then
    git clone https://github.com/HOGENT-RISE/2526-dotnet-template.git /2526-dotnet-template
fi

cd /2526-dotnet-template

echo "Building Docker image"
docker build -t rise-server -f /2526-dotnet-template/docker_deploy/Dockerfile .

echo "Starting Docker container"
docker run -d \
    --name rise-server \
    -p 5001:5001 \
    rise-server

echo "Application started on port 5001"
