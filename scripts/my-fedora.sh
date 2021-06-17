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
ln -s ~/.dotfiles/git/.gitconfig ~/
ln -s ~/.dotfiles/git/.gitignore_global ~/

# Install zsh xclip, tmux and vim
sudo dnf update -y
sudo dnf install -y zsh xclip tmux vim vim-X11 neovim exa ripgrep fd-find fzf
ln -s ~/.dotfiles/tmux/.tmux.conf ~/
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/ctags/.ctags ~/
cd ~/.dotfiles
git submodule update --init --recursive

# Neovim
mkdir -p ~/.local/share/nvim/site
mkdir -p ~/.config/nvim
ln -s ~/.dotfiles/vim/pack ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/ftplugin ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/plugin ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/undodir ~/.local/share/nvim/site/
ln -s ~/.dotfiles/vim/coc-settings.json ~/.config/nvim/
ln -s ~/.dotfiles/nvim/init.vim ~/.config/nvim/

# Shell
ln -fs ~/.dotfiles/shell/.common_bash_zsh ~/
ln -fs ~/.dotfiles/shell/.common_profile ~/
ln -fs ~/.dotfiles/shell/.aliases ~/

# Bashrc
ln -fs ~/.dotfiles/shell/bash/.git-prompt.sh ~/
ln -fs ~/.dotfiles/shell/bash/.inputrc ~/
ln -fs ~/.dotfiles/shell/bash/.bashrc ~/
ln -fs ~/.dotfiles/shell/bash/.bash_profile ~/
ln -fs ~/.dotfiles/shell/bash/.bash_functions ~/

# Zshrc
ln -fs ~/.dotfiles/shell/zsh/.zshrc ~/
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Starship theme
sh -c "$(curl -fsSL https://starship.rs/install.sh)"
ln -fs ~/.dotfiles/shell/startship/starship.toml ~/.config/

# Gnome nord-theme
git clone https://github.com/arcticicestudio/nord-gnome-terminal.git
./nord-gnome-terminal/src/nord.sh
rm -rf nord-gnome-terminal

# Programming
sudo dnf install -y docker golang openfortivpn

# Code dir config
sudo mkdir ~/code
cd ~/code
sudo mkdir ephemeral projects go
sudo chown $USER ephemeral/ projects/ go/
mkdir ~/code/go/bin
mkdir ~/ephemeral

# vscode
mkdir -p ~/.config/Code/User
ln -s ~/.dotfiles/vscode/settings.json ~/.config/Code/User/
ln -s ~/.dotfiles/vscode/keybindings.json ~/.config/Code/User/
mkdir -p ~/.vscode/extensions/

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
mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions
ln -s /opt/kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh
ln -s /opt/kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh


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
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
source ~/.bashrc
source /usr/share/git/completion/git-completion.bash
nvm install stable
nvm use node

# flatpak
sudo dnf install -y flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
# spotify & synology drive
flatpak install -y flathub com.spotify.Client

# rpmfusion
sudo dnf install \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# multimedia codecs
sudo dnf install gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel
sudo dnf install lame\* --exclude=lame-devel
sudo dnf group upgrade --with-optional Multimedia

# SynologyDrive
#> sudo dnf install alien
#> 1. Download .deb package from Synology website
#> 2. sudo alien --to-rpm -vv synology-drive-*.deb
#> 3. sudo rpm -ivh synology-drive-*.rpm --nodeps --force
#> 4. sudo ln -s /usr/lib/nautilus/extensions-3.0/libnautilus-drive-extension.so /usr/lib64/nautilus/extensions-3.0/
