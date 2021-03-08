ARG BASE_IMAGE_VERSION=latest

FROM docker.pkg.github.com/tomasaschan/vscode-devcontainers/base-ubuntu-20.04:${BASE_IMAGE_VERSION}

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    haskell-stack \
    libicu-dev \
    libncurses-dev \
    libtinfo5 \
    libtinfo-dev \
    libgmp-dev \
    libpcre3-dev \
    zlib1g-dev \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

ENV PATH="/home/dev/.local/bin:${PATH}"

RUN stack upgrade \
    --binary-only \
    --local-bin-path /home/dev/.local/bin \
    --install-ghc && \
    chown -R dev:dev /home/dev

USER dev

WORKDIR /home/dev

ARG STACK_SNAPSHOT=lts-16.31

RUN mkdir -p /home/dev/.stack/global-project && \
    (echo "packages: []"; echo "snapshot: ${STACK_SNAPSHOT}") > /home/dev/.stack/global-project/stack.yaml

RUN stack ls snapshots

WORKDIR /workspace

RUN stack install brittany ormolu stylish-haskell hspec-discover
