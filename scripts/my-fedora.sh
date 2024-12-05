#!/bin/bash

# Dotfiles caconka

# Fonts
fc-cache -f -v
mkdir -p ~/.local/share/fonts
ln -fs ~/.dotfiles/fonts/* ~/.local/share/fonts/

# Icons
mkdir -p ~/.local/share/icons
ln -fs ~/.dotfiles/icons/* ~/.local/share/icons/

# Shorcuts
for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

for i in {1..5}; do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"
gsettings set org.gnome.settings-daemon.plugins.media-keys mic-mute "['<Super>m']"

# Git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Terminal wezterm
# sudo dnf copr enable wezfurlong/wezterm-nightly
# sudo dnf install -y wezterm
# ln -s ~/.dotfiles/shell/wezterm ~/.config/wezterm

# Install xclip, tmux and neovim
sudo dnf install -y xclip tmux neovim eza ripgrep fd-find fzf bat
mkidr -p ~/.tmux/plugins/tmp
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux package manager
ln -s ~/.dotfiles/shell/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/ctags/ctags ~/.ctags

# Code dir config
sudo mkdir ~/code
cd ~/code
git clone git@github.com:caconka/code-configs.git code-configs
mkdir ephemeral projects go
mkdir ~/code/go/bin
mkdir ~/ephemeral
ln -fs ~/.dotfiles/.editorconfig ~/

# Shell
mkdir -p ~/.shell/work
ln -fs ~/.dotfiles/shell/profile ~/.shell/
ln -fs ~/.dotfiles/shell/aliases ~/.shell/
ln -fs ~/.dotfiles/shell/functions ~/.shell/
ln -fs ~/.dotfiles/shell/work/masmovil/* ~/.shell/work/
ln -fs ~/code/code-configs/shell/work/masmovil/mm-aliases ~/.shell/work/mm-aliases
ln -fs ~/code/code-configs/shell/work/masmovil/mm-bash ~/.shell/work/mm-shell

# Zsh
sudo dnf install -y zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -fs ~/.dotfiles/shell/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/shell/zsh/patches.zsh ~/.oh-my-zsh/custom/patches.zsh

# Pure theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Fish
sudo dnf install -y fish
mkdir -p ~/.config/fish/completions
mkdir ~/.config/fish/functions
mkdir ~/.config/fish/work
ln -fs ~/.dotfiles/shell/aliases ~/.config/fish/
ln -fs ~/.dotfiles/shell/fish/config.fish ~/.config/fish/
ln -fs ~/.dotfiles/shell/fish/completions/bazel.fish ~/.config/fish/completions/
ln -fs ~/.dotfiles/shell/fish/functions/* ~/.config/fish/functions/
ln -fs ~/code/code-configs/shell/work/masmovil/mm-aliases ~/.config/fish/work/mm-aliases
ln -fs ~/code/code-configs/shell/work/masmovil/mm-fish ~/.config/fish/work/mm-shell

curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install edc/bass
fisher install reitzig/sdkman-for-fish@v2.1.0

# idea
ln -s ~/.dotfiles/idea/.ideavimrc ~/
sudo ln -s ~/.dotfiles/idea/idea.conf /etc/sysctl.d/

# Gcloud & kubectl
sudo tee -a /etc/yum.repos.d/google-cloud-sdk.repo << EOM
[google-cloud-sdk]
name=Google Cloud SDK
baseurl=https://packages.cloud.google.com/yum/repos/cloud-sdk-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=0
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg
       https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOM
cat <<EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF
sudo dnf install -y google-cloud-sdk kubectl

# Docker
sudo dnf install -y docker-cli containerd
sudo systemctl start docker
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

# kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# kubectl completions
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s /opt/kubectx/completion/_kubectx.zsh ~/.oh-my-zsh/completions/
ln -s /opt/kubectx/completion/_kubens.zsh ~/.oh-my-zsh/completions/

# Postman
# POSTMAN_FILE=postman-linux-x64.tar.gz
# wget https://dl.pstmn.io/download/latest/linux64 -O $POSTMAN_FILE
# sudo tar -xvzf $POSTMAN_FILE -C /opt
# sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
# rm $POSTMAN_FILE
# mkdir -p ~/.local/share/applications
# cat << EOF > ~/.local/share/applications/postman.desktop
# [Desktop Entry]
# Encoding=UTF-8
# Name=Postman
# Exec=/usr/local/bin/postman
# Icon=/opt/Postman/app/resources/app/assets/icon.png
# Keywords=api;
# Terminal=false
# Type=Application
# Categories=Development;Utilities;
# EOF
# chmod +x ~/.local/share/applications/postman.desktop

# Bruno
flatpak install flathub com.usebruno.Bruno

# Go
sudo dnf install -y golang

# Java
curl -s https://get.sdkman.io | bash
source ~/.sdkman/bin/sdkman-init.sh
sdk install java
sdk install maven
sdk install gradle

# Node
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
nvm install stable
nvm use node

# rpmfusion
# sudo dnf install -y \
#   https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
# 	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# nvidia drivers
#sudo dnf install akmod-nvidia

# multimedia codecs
sudo dnf groupupdate multimedia sound-and-video
# for firefox
sudo dnf install ffmpeg-libs

chsh -s $(which fish)
