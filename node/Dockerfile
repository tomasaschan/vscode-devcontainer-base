ARG BASE_IMAGE_VERSION=latest

FROM docker.pkg.github.com/tomasaschan/vscode-devcontainers/base-ubuntu-20.04:${BASE_IMAGE_VERSION}

USER dev

ARG NODE_VERSION=12

RUN curl -s https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh -o /home/dev/install-nvm.sh && \
    chmod +x /home/dev/install-nvm.sh && \
    /home/dev/install-nvm.sh && \
    rm /home/dev/install-nvm.sh
