#!/bin/sh

DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - 
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" 
add-apt-repository ppa:git-core/ppa 

apt-get update 
apt-get install -y \
    docker-ce-cli \
    entr \
    git \
    gnupg2 \
    httpie \
    nano \
    openssh-client \
    rsync \
    sudo \
    unzip \
    
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

apt-get autoremove -y 
apt-get clean autoclean 
rm -rf /var/lib/{apt,dpkg,cache,log} 
