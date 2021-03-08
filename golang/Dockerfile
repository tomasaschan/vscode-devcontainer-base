ARG GOLANG_VERSION=latest

FROM golang:${GOLANG_VERSION}

COPY install-build-tools.sh /tmp/
RUN /tmp/install-build-tools.sh

COPY install-dev-tools.sh /tmp/
RUN /tmp/install-dev-tools.sh

COPY configure-system.sh /tmp/
RUN /tmp/configure-system.sh

COPY setup-user.sh /tmp/
RUN /tmp/setup-user.sh

RUN \
  go get -v github.com/ramya-rao-a/go-outline && \
  go get -v golang.org/x/tools/gopls
