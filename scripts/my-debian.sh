#!/bin/bash

# Dotfiles caconka

# Fonts
mkdir ~/.fonts
ln -s ~/.dotfiles/fonts/Inconsolata-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/AnonymousPro-Regular.ttf ~/.fonts/
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/
ln -s ~/.dotfiles/git/.gitignore_global ~/

# Installs basics
sudo apt update -y
sudo apt install -y zip file-roller qpdfview jq curl zsh

# Install xclip, tmux and vim
sudo apt remove -y --auto-remove vim
sudo apt install -y xclip tmux vim-gui-common neovim exuberant-ctags tree silversearcher-ag cmake
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/
cd ~/.dotfiles
git submodule update --init --recursive

# Bashrc
ln -s ~/.dotfiles/bash/.git-prompt.sh ~/
ln -s --force ~/.dotfiles/bash/.inputrc ~/
ln -s --force ~/.dotfiles/bash/.bashrc ~/
ln -s --force ~/.dotfiles/bash/.bash_profile ~/
ln -s --force ~/.dotfiles/bash/.aliases ~/

# Zshrc
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -s --force ~/.dotfiles/zsh/.zshrc ~/

# Programming
sudo apt install -y docker docker-compose fzf redis postgresql golang-go

# Docker
sudo usermod -a -G docker $USER

# MongoDB
# sudo systemctl enable mongodb
# sudo systemctl start mongodb

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects go
sudo chown $USER ephemeral/ projects/ go/
mkdir ~/code/go/bin

# vscode
mkdir -p ~/.config/Code/User
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
mkdir -p ~/.vscode/extensions/
# ln -s ~/.dotfiles/vscode/tomorrow.night ~/.vscode/extensions/tomorrow.night

# Postman
wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz
sudo tar -xvzf postman-linux-x64.tar.gz -C /opt
sudo ln -s /opt/Postman/Postman /usr/bin/postman
rm postman-linux-x64.tar.gz

# kubectl
sudo apt install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt update
sudo apt install -y kubectl

# Install basics
sudo apt install -y gimp inkscape mpv chromium ack kubectx jmtpfs

# Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven
sdk install gradle

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
source /usr/share/git/completion/git-completion.bash
nvm install stable
nvm use node

# NPM
sudo apt install -y npm
# mkdir ~/.npm-global
# npm config set prefix ~/.npm-global
source ~/.bashrc
