#!/bin/sh

DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
add-apt-repository ppa:git-core/ppa 

apt-get update 
apt-get install -y \
    docker-ce-cli \
    git \
    gnupg2 \
    nano \
    openssh-client \
    sudo \
    unzip \
    
apt-get autoremove -y 
apt-get clean autoclean 
rm -rf /var/lib/{apt,dpkg,cache,log} 
