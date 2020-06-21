FROM fpco/stack-build:lts-15.15

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

RUN apt-get update && \
    apt-get install -y \
    libicu-dev \
    libtinfo-dev \
    libgmp-dev \
    zlib1g-dev \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}
