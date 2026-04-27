#!/bin/bash

# Shell
mkdir -p ~/.shell/work
ln -fs ~/code/code-configs/shell/work/masmovil/mm-bash ~/.shell/work/mm-shell

# Code dir config
mkdir ~/code/masmovil
ln -s ~/.dotfiles/git/gitconfig_masmovil ~/code/masmovil/.gitconfig

# Fish
mkdir ~/.config/fish/work
ln -fs ~/code/code-configs/shell/work/masmovil/fish/completions/* ~/.config/fish/completions/
ln -fs ~/code/code-configs/shell/work/masmovil/mm-fish ~/.config/fish/work/mm-shell

# Gcloud & kubectl
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-cli]
name=Google Cloud CLI
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el9-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
sudo dnf install -y google-cloud-sdk google-cloud-sdk-gke-gcloud-auth-plugin kubectl

# kubectl krew plugin manager
(
set -x; cd "$(mktemp -d)" &&
	OS="$(uname | tr '[:upper:]' '[:lower:]')" &&
	ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" &&
	KREW="krew-${OS}_${ARCH}" &&
	curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" &&
	tar zxvf "${KREW}.tar.gz" &&
	./"${KREW}" install krew
)

# Docker
ln -s ~/code/code-configs/docker/mm-config.json ~/.docker/config.json

# Podman
ln -s ~/code/code-configs/docker/mm-config.json ~/.config/containers/auth.json
