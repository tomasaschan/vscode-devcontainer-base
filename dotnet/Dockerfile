FROM mcr.microsoft.com/dotnet/sdk:5.0-focal

VOLUME /workspace
WORKDIR /workspace

COPY install-build-tools.sh /tmp/
RUN chmod +x /tmp/install-build-tools.sh && /tmp/install-build-tools.sh

COPY install-dev-tools.sh /tmp/
RUN chmod +x /tmp/install-dev-tools.sh && /tmp/install-dev-tools.sh

COPY configure-system.sh /tmp/
RUN chmod +x /tmp/configure-system.sh && /tmp/configure-system.sh

COPY setup-user.sh /tmp/
RUN chmod +x /tmp/setup-user.sh && /tmp/setup-user.sh

USER dev
