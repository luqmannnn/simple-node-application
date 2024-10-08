#!/bin/bash
# Update the package index
yum update -y

# Install Docker
yum install -y docker
systemctl start docker
systemctl enable docker

# Install Git
yum install -y git

# Install Node.js 
yum install -y nodejs

# Verify installations
docker --version
git --version
node --version
