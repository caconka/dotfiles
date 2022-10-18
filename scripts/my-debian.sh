#!/bin/bash

# Dotfiles caconka

# keybindings
# setxkbmap -option caps:swapescape
# macbook keybindings fix -> https://github.com/free5lot/hid-apple-patched/

# Fonts
mkdir ~/.fonts
fc-cache -f -v

# Git
ln -s ~/.dotfiles/git/.gitconfig ~/
ln -s ~/.dotfiles/git/.gitignore_global ~/

# Installs basics
sudo apt update -y
sudo apt install -y zip file-roller qpdfview jq curl zsh

# Install xclip, tmux and vim
sudo apt remove -y --auto-remove vim
sudo apt install -y xclip tmux vim-gui-common neovim exuberant-ctags tree exa \
	ripgrep cmake python3 python3-pip
sudo apt install -y fd-find
sudo ln -s /usr/lib/cargo/bin/fd /usr/bin/
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/
cd ~/.dotfiles
git submodule update --init --recursive

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
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

sudo mkdir /usr/local/appimage
curl -LO https://github.com/neovim/neovim/releases/download/stable/nvim.appimage
chmod u+x nvim.appimage
sudo mv nvim.appimage /usr/local/appimage/nvim

# Bashrc
ln -s ~/.dotfiles/shell/bash/.git-prompt.sh ~/
ln -s --force ~/.dotfiles/shell/bash/.inputrc ~/
ln -s --force ~/.dotfiles/shell/bash/.bashrc ~/
ln -s --force ~/.dotfiles/shell/bash/.bash_profile ~/
ln -s --force ~/.dotfiles/shell/bash/.bash_functions ~/
ln -s --force ~/.dotfiles/shell/zsh/.zshrc ~/
ln -s --force ~/.dotfiles/shell/.common_profile ~/
ln -s --force ~/.dotfiles/shell/.aliases ~/

# Programming
sudo apt install -y docker docker-compose redis postgresql

# Golang
goVersion=go1.14.3.linux-amd64.tar.gz
wget https://dl.google.com/go/$goVersion
sudo tar -xvzf $goVersion -C /opt
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
sudo ln -s /opt/Postman/Postman /usr/local/bin/postman
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

# VPN
sudo apt install openfortivpn

# Install basics
#sudo apt install -y gimp inkscape mpv ack kubectx jmtpfs ac
sudo apt install -y chromium-browser

# Spotify
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Java
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java
sdk install maven
sdk install gradle

# Zshrc
ln -s --force ~/.dotfiles/zsh/.zshrc ~/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Node
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash
source ~/.bashrc
source /usr/share/git/completion/git-completion.bash
nvm install stable
nvm use node
