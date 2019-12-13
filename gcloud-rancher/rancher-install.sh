#!/bin/bash

apt-get update
apt-get -y install apt-transport-https ca-certificates curl software-properties-common
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

apt-get update
apt-get -y install docker-ce
usermod -G docker ec2-user
docker run -d --restart=unless-stopped -p 80:80 -p 443:443 rancher/server:preview
