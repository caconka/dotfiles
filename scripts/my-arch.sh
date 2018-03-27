#!/bin/bash

# Dotfiles caconka

# Fonts
mkdir ~/.fonts
ln -s ~/.dotfiles/fonts/SourceCodePro-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/SourceSansPro-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/Inconsolata-Regular.ttf ~/.fonts/
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/

# Install tmux and vim
sudo pacman -Syy --noconfirm tmux gvim
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim

# Bashrc
ln -s ~/.dotfiles/bash/.git-prompt.sh ~/
ln -s --force ~/.dotfiles/bash/.bashrc ~/
source ~/.bashrc

# NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh | bash
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
sudo pacman -S --noconfirm npm
mkdir ~/.npm-global
npm config set prefix ~/.npm-global
source ~/.bashrc

# Install pacaur, mongodb, emacs
sudo pacman -S --noconfirm pacaur mongodb emacs linux-headers virtualbox

# MongoDB
sudo systemctl enable mongodb
sudo systemctl start mongodb

# emacs / evil-mode
mkdir ~/.emacs.d
ln -s ~/.dotfiles/emacs/init.el ~/.emacs.d/
ln -s --force ~/.dotfiles/emacs/.emacs ~/

# vscode
pacaur -Syy --noconfirm visual-studio-code-bin
mkdir -p ~/.config/Code/User
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
mkdir -p ~/.vscode/extensions/
ln -s ~/.dotfiles/vscode/tomorrow.night ~/.vscode/extensions/tomorrow.night

# Install basics
pacaur -S --noconfirm firefox google-chrome slack-desktop postman-bin \
  telegram-desktop gimp inkscape spotify mailspring dropbox ack

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects
sudo chown $USER ephemeral/ projects/

