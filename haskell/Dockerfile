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

RUN stack upgrade \
    --binary-only \
    --local-bin-path /home/dev/.local/bin \
    --install-ghc && \
    chown -R dev:dev /home/dev

RUN git clone https://github.com/haskell/haskell-language-server --recurse-submodules /opt/haskell-language-server && \
    cd /opt/haskell-language-server && \
    chown -R dev:dev /opt/haskell-language-server

USER dev

WORKDIR /home/dev

RUN stack ls snapshots

WORKDIR /opt/haskell-language-server
    
RUN cat /opt/haskell-language-server/install/stack.yaml

RUN sed -i "s/^resolver: .*/resolver: $(cat /home/dev/.stack/global-project/stack.yaml | grep resolver | cut -d' ' -f2)/" /opt/haskell-language-server/install/stack.yaml && \
    sed -i "s/^resolver: .*/resolver: $(cat /home/dev/.stack/global-project/stack.yaml | grep resolver | cut -d' ' -f2)/" /opt/haskell-language-server/stack.yaml && \
    sed -i 's/extra-deps:$/extra-deps:\n  - shake-0.18.5/' /opt/haskell-language-server/install/stack.yaml

RUN stack ./install.hs hls

WORKDIR /workspace

RUN stack install brittany

ENV PATH="/home/dev/.local/bin:${PATH}"
