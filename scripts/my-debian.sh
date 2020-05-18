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
sudo apt install -y xclip tmux vim-gui-common neovim exuberant-ctags tree \
	fd ripgrep cmake python3 python3-pip
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/
cd ~/.dotfiles
git submodule update --init --recursive

# fzf
git clone git@github.com:19-1-skku-oss/fzf.git ~/.fzf
cd ~/.fzf && ./install

# yq
sudo curl -L -o /usr/local/bin/yq \
	https://github.com/mikefarah/yq/releases/latest/download/yq_linux_amd64 \
	&& sudo chmod +x /usr/local/bin/yq

# Nvim
mkdir -p ~/.local/share/nvim/site
mkdir -p ~/.config/nvim
mkdir -p ~/.dotfiles/vim/undodir
ln -s ~/.dotfiles/vim/pack ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/ftplugin ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/plugin ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/undodir ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/

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
sudo apt install -y docker docker-compose redis postgresql

# Golang
goVersion=go1.14.1.linux-amd64.tar.gz
wget https://dl.google.com/go/$goVersion
sudo -xvzf $goVersion -C /opt
sudo ln -s /opt/go/bin/* /usr/bin/
rm $goVersion

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
mkdir -p ~/.local/share/applications
## Postman icon
cat << EOF > ~/.local/share/applications/postman2.desktop
[Desktop Entry]
Name=Postman
GenericName=API Client
X-GNOME-FullName=Postman API Client
Comment=Make and view REST API calls and responses
Keywords=api;
Exec=/opt/Postman/Postman
Terminal=false
Type=Application
Icon=/opt/Postman/app/resources/app/assets/icon.png
Categories=Development;Utilities;
EOF

# Gcloud & kubectl
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
sudo apt install -y apt-transport-https ca-certificates gnupg
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
sudo apt update && sudo apt -y install google-cloud-sdk kubectl

# Install basics
sudo apt install -y gimp inkscape mpv chromium ack kubectx jmtpfs

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo apt-get update && sudo apt-get install spotify-client

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
