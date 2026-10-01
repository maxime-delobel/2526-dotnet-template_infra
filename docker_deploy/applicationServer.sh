#!/bin/bash
set -euo pipefail
echo "Installing dependencies"
apt-get install -y git


echo "Cloning the repo"
cd /
if [ ! -d /2526-dotnet-template-infra ]; then
    git clone https://github.com/maxime-delobel/2526-dotnet-template_infra.git /2526-dotnet-template-infra
fi

cd /2526-dotnet-template-infra

echo "Building Docker image"
docker build -t rise-server -f /2526-dotnet-template-infra/docker_deploy/Dockerfile .

echo "Starting Docker container"
docker run -d \
    --name rise-server \
    -p 5001:5001 \
    rise-server

echo "Application started on port 5001"
