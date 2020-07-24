#!/usr/bin/env sh

groupadd docker

useradd -m dev -s /bin/bash
echo "dev:changeme" | chpasswd
usermod -aG sudo,docker dev

mkdir -p /workspace && \
chown -R dev:dev /workspace

mkdir -p /home/dev/.bashrc.d
printf 'if [ -d $HOME/.bashrc.d/ ]; then
  for rc in $HOME/.bashrc.d/*rc.sh; do
    source $rc
  done
fi
' >> /home/dev/.bashrc

mkdir -p /home/dev/.local/bin
echo 'export PATH=$HOME/.local/bin:$PATH' > /home/dev/.bashrc.d/localbinrc.sh
