#!/usr/bin/env sh

groupadd docker

useradd -m dev -s /bin/bash
echo "dev:changeme" | chpasswd
usermod -aG sudo,docker dev

mkdir -p /workspace && \
chown -R dev:dev /workspace

printf 'if [ -d $HOME/.bashrc.d/ ]; then
  for rc in $HOME/.bashrc.d/*rc.sh; do
    source $rc
  done
fi
' >> /home/dev/.bashrc
