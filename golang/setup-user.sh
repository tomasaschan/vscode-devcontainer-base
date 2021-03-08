#!/usr/bin/env sh

set -e

groupadd docker

useradd -m dev -s /bin/bash
echo "dev:changeme" | chpasswd
usermod -aG docker dev
echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

mkdir -p /workspace && \
chown -R dev:dev /workspace

mkdir -p /home/dev/.bashrc.d
# shellcheck disable=SC2016
printf 'if [ -d $HOME/.bashrc.d/ ]; then
  for rc in $HOME/.bashrc.d/*rc.sh; do
    source $rc
  done
fi
' >> /home/dev/.bashrc

mkdir -p /home/dev/.local/bin
# shellcheck disable=SC2016
echo 'export PATH=$HOME/.local/bin:$PATH' > /home/dev/.bashrc.d/localbinrc.sh

if [ -f /usr/local/share/copy-kube-config.sh ]; then
  chown dev:root /usr/local/share/copy-kube-config.sh
fi

printf 'if [ -f /usr/local/share/copy-kube-config.sh ]; then
  source /usr/local/share/copy-kube-config.sh
fi

if type "kubectl" > /dev/null 2>&1; then
  source <(kubectl completion bash)

  alias k=kubectl
  complete -F __start_kubectl k
fi
' > /home/dev/.bashrc.d/kubectlrc.sh

chown -R dev:dev /home/dev
