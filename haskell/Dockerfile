FROM docker.pkg.github.com/tomasaschan/vscode-devcontainers:base-ubuntu-20.04

RUN apt-get update && \
    apt-get install -y \
    haskell-stack \
    libicu-dev \
    libtinfo-dev \
    libgmp-dev \
    zlib1g-dev \
    && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/{apt,dpkg,cache,log}

RUN git clone https://github.com/haskell/haskell-language-server --recurse-submodules /opt/haskell-language-server && \
    cd /opt/haskell-language-server && \
    chown -R dev:dev /opt/haskell-language-server

RUN stack upgrade \
    --binary-only \
    --local-bin-path /home/dev/.local/bin \
    --install-ghc && \
    chown -R dev:dev /home/dev

USER dev

WORKDIR /home/dev

RUN stack ls snapshots

WORKDIR /opt/haskell-language-server

RUN sed -i "s/^resolver: .*/resolver: $(cat /home/dev/.stack/global-project/stack.yaml | grep resolver | cut -d' ' -f2)/" /opt/haskell-language-server/install/shake.yaml && \
    sed -i "s/^resolver: .*/resolver: $(cat /home/dev/.stack/global-project/stack.yaml | grep resolver | cut -d' ' -f2)/" /opt/haskell-language-server/stack.yaml

RUN stack ./install.hs hls

RUN strack install brittany

WORKDIR /workspace