#!/bin/sh

set -e

DEBIAN_FRONTEND=noninteractive

curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/$(lsb_release -is | tr '[:upper:]' '[:lower:]') $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

apt-get update 
apt-get install -y \
    bash-completion \
    docker-ce-cli \
    entr \
    git \
    git-extras \
    gnupg2 \
    httpie \
    nano \
    openssh-client \
    rsync \
    sudo \
    unzip \
    
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

curl -sSL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/"$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)"/bin/linux/amd64/kubectl
chmod +x /usr/local/bin/kubectl

curl https://raw.githubusercontent.com/microsoft/vscode-dev-containers/master/containers/kubernetes-helm/.devcontainer/copy-kube-config.sh -o /usr/local/share/copy-kube-config.sh

apt-get autoremove -y 
apt-get clean autoclean 
rm -rf /var/lib/{apt,dpkg,cache,log} 
