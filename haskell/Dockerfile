FROM docker.pkg.github.com/tomasaschan/vscode-devcontainers/base-ubuntu-20.04:0.1

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    haskell-stack \
    libicu-dev \
    libncurses-dev \
    libtinfo5 \
    libtinfo-dev \
    libgmp-dev \
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

RUN stack ls snapshots

WORKDIR /workspace

RUN stack install brittany

