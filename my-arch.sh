#!/bin/bash

# Dotfiles
# first git clone https://github.com/caconka/dotfiles.git
# cd ~/
# mv dotfiles/ .dotfiles/

# Fonts
mkdir ~/.fonts
ln -s ~/.dotfiles/fonts/SourceCodePro-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/SourceSansPro-Regular.ttf ~/.fonts/
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/

# Install tmux and vim
sudo pacman -S tmux vim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim

# Bashrc
ln -s ~/.dotfiles/bash/.git-prompt.sh ~/
ln -s --force ~/.dotfiles/bash/.bashrc ~/

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
source ~/.bashrc
nvm install stable
nvm use node

# Upgrade NVM
(
  cd "$NVM_DIR"
  git fetch origin
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" origin`
) && . "$NVM_DIR/nvm.sh"

# NPM
sudo pacman -S npm
mkdir ~/.npm-global
npm config set prefix ~/.npm-global
source ~/bashrc

# MongoDB
sudo pacman -S mongodb
sudo systemctl enable mongodb
sudo systemctl start mongodb

# vscode
yaourt -S visual-studio-code
mkdir -p ~/.config/Code/User
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/

# Install basics
yaourt -S firefox-developer google-chrome slack-desktop postman-bin studio-3t gimp inkscape spotify

