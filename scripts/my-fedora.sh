#!/bin/bash

# Dotfiles caconka

# Fonts
mkdir ~/.fonts
fc-cache -f -v

# Shorcuts
for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

for i in {1..5}; do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done

gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"

# Git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Terminal kitty
sudo dnf update -y
sudo dnf install -y kitty
mkdir ~/.config/kitty
wget https://raw.githubusercontent.com/sonph/onehalf/master/kitty/onehalf-light.conf -P ~/.config/kitty
ln -s ~/.dotfiles/shell/kitty/kitty.conf ~/.config/kitty/

# Install zsh xclip, tmux and vim
sudo dnf install -y zsh xclip tmux vim vim-X11 exa ripgrep fd-find fzf bat
ln -s ~/.dotfiles/shell/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/ctags ~/.ctags
cd ~/.dotfiles
git submodule update --init --recursive

# Neovim
# mkdir -p ~/.local/share/nvim/site
# mkdir -p ~/.config/nvim
# ln -s ~/.dotfiles/vim/pack ~/.local/share/nvim/site/
# ln -s ~/.dotfiles/vim/ftplugin ~/.local/share/nvim/site/
# ln -s ~/.dotfiles/vim/plugin ~/.local/share/nvim/site/
# ln -s ~/.dotfiles/vim/undo ~/.local/share/nvim/site/
# ln -s ~/.dotfiles/vim/backup ~/.local/share/nvim/site/
# ln -s ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/
# ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/

# Shell
mkdir ~/.shell
ln -fs ~/.dotfiles/shell/common ~/.shell/
ln -fs ~/.dotfiles/shell/profile ~/.shell/
ln -fs ~/.dotfiles/shell/aliases ~/.shell/
ln -fs ~/.dotfiles/shell/functions ~/.shell/

# Programming
sudo dnf install -y docker golang

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects go
sudo chown $USER ephemeral/ projects/ go/
mkdir ~/code/go/bin
mkdir ~/ephemeral
ln -fs ~/.dotfiles/.editorconfig ~/

# vscode
# mkdir -p ~/.config/Code/User
# ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
# ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
# mkdir -p ~/.vscode/extensions/

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

# kubectx
sudo git clone https://github.com/ahmetb/kubectx /opt/kubectx
sudo ln -s /opt/kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s /opt/kubectx/kubens /usr/local/bin/kubens

# Postman
POSTMAN_FILE=postman-linux-x64.tar.gz
wget https://dl.pstmn.io/download/latest/linux64 -O $POSTMAN_FILE
sudo tar -xvzf $POSTMAN_FILE -C /opt
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
rm $POSTMAN_FILE
mkdir -p ~/.local/share/applications
cat << EOF > ~/.local/share/applications/postman.desktop
[Desktop Entry]
Encoding=UTF-8
Name=Postman
Exec=/usr/local/bin/postman
Icon=/opt/Postman/app/resources/app/assets/icon.png
Keywords=api;
Terminal=false
Type=Application
Categories=Development;Utilities;
EOF

# Docker
sudo usermod -a -G docker $USER

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
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# nvidia drivers
#sudo dnf install akmod-nvidia

# multimedia codecs
sudo dnf groupupdate multimedia sound-and-video
# for firefox
sudo dnf install ffmpeg-libs

# Zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -fs ~/.dotfiles/shell/zsh/zshrc ~/.zshrc
ln -fs ~/.dotfiles/shell/zsh/patches.zsh ~/.oh-my-zsh/custom/patches.zsh

# Pure theme
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# kubectl completions
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s /opt/kubectx/completion/_kubectx.zsh ~/.oh-my-zsh/completions/
ln -s /opt/kubectx/completion/_kubens.zsh ~/.oh-my-zsh/completions/
