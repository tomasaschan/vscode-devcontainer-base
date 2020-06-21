ARG UBUNTU_VERSION=20.04

FROM ubuntu:${UBUNTU_VERSION}

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    apt-transport-https \
    curl \
    ca-certificates \
    lsb-release \
    software-properties-common \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    add-apt-repository ppa:git-core/ppa && \
    apt-get update && \
    apt-get install -y \
    docker-ce-cli \
    git \
    gnupg2 \
    nano \
    openssh-client \
    sudo \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log} && \
    groupadd docker

RUN useradd -m dev -s /bin/bash && \
    echo "dev:changeme" | chpasswd && \
    usermod -aG sudo,docker dev

RUN mkdir -p /workspace && \
    chown -R dev:dev /workspace

VOLUME /workspace

WORKDIR /workspace
