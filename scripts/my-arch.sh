#!/bin/bash

# Dotfiles caconka

# Fonts
mkdir ~/.fonts
sudo pacman -Syy --noconfirm adobe-source-code-pro-fonts
ln -s ~/.dotfiles/fonts/Inconsolata-Regular.ttf ~/.fonts/
ln -s ~/.dotfiles/fonts/AnonymousPro-Regular.ttf ~/.fonts/
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/

# Install xclip, tmux and vim
sudo pacman -S --noconfirm xclip tmux gvim ctags tree the_silver_searcher cmake
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/

# Bashrc
ln -s ~/.dotfiles/bash/.git-prompt.sh ~/
ln -s ~/.dotfiles/bash/.inputrc ~/
ln -s --force ~/.dotfiles/bash/.bashrc ~/
echo > ~/.inputrc 'set colored-stats on'
source ~/.bashrc
source /usr/share/git/completion/git-completion.bash

# Install yay, mongodb, postgre, redis, docker, fzf
sudo pacman -S --noconfirm yay mongodb docker docker-compose fzf redis postgresql

# MongoDB
sudo systemctl enable mongodb
sudo systemctl start mongodb

# Install virtualbox
sudo pacman -S --noconfirm linux-headers virtualbox virtualbox-ext-vnc

# golang
sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
export PATH=$PATH:/usr/local/go/bin
echo >> ~/.bash_profile 'export GOPATH=$HOME/code/go'
echo >> ~/.bash_profile 'export PATH=$PATH:/usr/local/go/bin'

# LANG env
export LANG=en_US.UTF-8

# Android support mtp protocol
sudo pacman -S --noconfirm mtpfs gvfs-mtp gvfs-gphoto2

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects go
sudo chown $USER ephemeral/ projects/ go/

# vscode
yay -Syy --noconfirm visual-studio-code-bin
mkdir -p ~/.config/Code/User
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
mkdir -p ~/.vscode/extensions/
ln -s ~/.dotfiles/vscode/tomorrow.night ~/.vscode/extensions/tomorrow.night

# Install basics
sudo pacman -S --noconfirm firefox gimp inkscape mpv chromium
yay -S --noconfirm postman-bin dropbox ack jmtpfs kubectl-bin

# NVM
yay -S --noconfirm nvm
source ~/.bashrc
nvm install stable
nvm use node

# NPM
sudo pacman -S --noconfirm npm
mkdir ~/.npm-global
npm config set prefix ~/.npm-global
source ~/.bashrc
