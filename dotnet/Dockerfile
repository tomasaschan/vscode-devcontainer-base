FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y \
    apt-transport-https \
    curl \
    ca-certificates \
    gnupg2 \
    lsb-release \
    software-properties-common \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" && \
    add-apt-repository ppa:git-core/ppa && \
    echo "got this far"
RUN apt-get update && \
    apt-get install -y \
    docker-ce-cli \
    git \
    nano \
    openssh-client \
    sudo \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

RUN groupadd docker && \
    useradd -m dev -s /bin/bash && \
    echo "dev:changeme" | chpasswd && \
    usermod -aG sudo,docker dev

RUN mkdir -p /workspace && \
    chown -R dev:dev /workspace

VOLUME /workspace

WORKDIR /workspace
