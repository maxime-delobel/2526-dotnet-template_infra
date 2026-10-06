#!/bin/bash
set -euo pipefail
echo "Installing dependencies"
apt-get install -y git


echo "Cloning the repo"

echo "Building Docker image"
docker build -t rise-server -f ./docker_deploy/Dockerfile .

echo "Running database migrations"
docker run --rm \
    rise-server \
    dotnet ef database update \
    --startup-project /app/src/Rise.Server \
    --project /app/src/Rise.Persistence

echo "Starting Docker container"
docker run -d \
    --name rise-server \
    -p 5001:5001 \
    rise-server

echo "Application started on port 5001"
