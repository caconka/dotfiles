#!/bin/bash

# Dotfiles caconka

# Caps-lock -> ESC
setxkbmap -option caps:escape

# Fonts
mkdir ~/.fonts
sudo pacman -Syy --noconfirm adobe-source-code-pro-fonts
ln -s ~/.dotfiles/fonts/Inconsolata-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/AnonymousPro-Regular.ttf ~/.fonts/
fc-cache -f -v

# mutt
sudo pacman -S --noconfirm mutt
ln -s ~/.dotfiles/mutt ~/.mutt

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/
ln -s ~/.dotfiles/git/.gitignore_global ~/

# Installs basics
sudo pacman -S --noconfirm zip file-roller qpdfview

# Install xclip, tmux and vim
sudo pacman -R --noconfirm vim
sudo pacman -S --noconfirm xclip tmux gvim ctags tree the_silver_searcher cmake
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/

# Bashrc
ln -s ~/.dotfiles/bash/.git-prompt.sh ~/
ln -s --force ~/.dotfiles/bash/.inputrc ~/
ln -s --force ~/.dotfiles/bash/.bashrc ~/
ln -s --force ~/.dotfiles/bash/.bash_profile ~/

# Programming
sudo pacman -S --noconfirm docker docker-compose fzf redis dbeaver postgresql go

# MongoDB
# sudo systemctl enable mongodb
# sudo systemctl start mongodb

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

# vscode
# yay -Syy --noconfirm visual-studio-code-bin
# mkdir -p ~/.config/Code/User
# ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
# ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
# mkdir -p ~/.vscode/extensions/
# ln -s ~/.dotfiles/vscode/tomorrow.night ~/.vscode/extensions/tomorrow.night

# yay
git clone https://aur.archlinux.org/yay.git ~/yay
cd ~/yay && makepkg -si
cd ~/ && rm -rf ~/yay

# Install basics
sudo pacman -S --noconfirm firefox gimp inkscape mpv chromium
yay -S --noconfirm postman-bin dropbox ack jmtpfs kubectl-bin kubernetes-helm

# Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven

# Node
yay -S --noconfirm nvm
source ~/.bashrc
source /usr/share/git/completion/git-completion.bash
nvm install stable
nvm use node

# NPM
sudo pacman -S --noconfirm npm
# mkdir ~/.npm-global
# npm config set prefix ~/.npm-global
source ~/.bashrc
