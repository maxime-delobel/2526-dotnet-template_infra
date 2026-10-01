#!/bin/bash
set -euo pipefail
echo "Installing dependencies"
apt-get install -y git

echo "Installing Docker"
# Add Docker's official GPG key:
apt-get update
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
tee /etc/apt/sources.list.d/docker.sources <<EOF
Types: deb
URIs: https://download.docker.com/linux/debian
Suites: $(. /etc/os-release && echo "$VERSION_CODENAME")
Components: stable
Architectures: $(dpkg --print-architecture)
Signed-By: /etc/apt/keyrings/docker.asc
EOF

apt-get update

systemctl enable --now docker

echo "Cloning the repo"
cd /home/vagrant
if [ ! -d /home/vagrant/2526-dotnet-template ]; then
    git clone https://github.com/HOGENT-RISE/2526-dotnet-template.git /home/vagrant/2526-dotnet-template
fi

cd /home/vagrant/2526-dotnet-template

echo "Building Docker image"
docker build -t rise-server -f /home/vagrant/docker_deploy/Dockerfile .

echo "Starting Docker container"
docker run -d \
    --name rise-server \
    -p 5001:5001 \
    rise-server

echo "Application started on port 5001"
