#!/bin/bash

# Fonts
mkdir ~/.fonts
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore_global

# Installs basics
sudo pacman -S --noconfirm zip file-roller qpdfview jq yq

# Install xclip, tmux and vim
sudo pacman -R --noconfirm vim
sudo pacman -S --noconfirm xclip tmux gvim ctags tree fd ripgrep cmake
ln -s ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/ctags ~/.ctags
cd ~/.dotfiles
git submodule update --init --recursive

# Zsh
ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc

# Programming
sudo pacman -S --noconfirm docker docker-compose fzf redis dbeaver go

# Install virtualbox
sudo pacman -S --noconfirm linux-headers virtualbox virtualbox-ext-vnc

# Android support mtp protocol
sudo pacman -S --noconfirm mtpfs gvfs-mtp gvfs-gphoto2

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects go
sudo chown $USER ephemeral/ projects/ go/
mkdir ~/code/go/bin

# yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay && makepkg -si
cd ~/ && rm -rf ~/yay

# Install basics
sudo pacman -S --noconfirm firefox gimp mpv
yay -S --noconfirm postman-bin dropbox ack jmtpfs

# Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven

# Node
yay -S --noconfirm nvm
nvm install stable
nvm use node

# NPM
# sudo pacman -S --noconfirm npm
# mkdir ~/.npm-global
# npm config set prefix ~/.npm-global
