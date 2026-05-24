#!/bin/bash

set -e

apt update -y

apt install docker.io unzip curl -y

systemctl enable docker

systemctl start docker

usermod -aG docker ubuntu

curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" \
-o "awscliv2.zip"

unzip awscliv2.zip

./aws/install

docker --version

aws --version