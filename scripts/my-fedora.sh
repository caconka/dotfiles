#!/bin/bash

# Dotfiles caconka

# Fonts
fc-cache -f -v
mkdir -p ~/.local/share/fonts
ln -fs ~/.dotfiles/fonts/* ~/.local/share/fonts/

mkdir -p ~/.local/share/icons
ln -s ~/.dotfiles/icons/* ~/.local/share/icons/

# Icons
mkdir -p ~/.local/share/icons
ln -fs ~/.dotfiles/icons/* ~/.local/share/icons/

# Shorcuts
for i in {1..9}; do
	gsettings set org.gnome.shell.keybindings switch-to-application-$i "[]"
done

for i in {1..5}; do
	gsettings set org.gnome.desktop.wm.keybindings switch-to-workspace-$i "['<Super>$i']"
done

gsettings set org.gnome.desktop.input-sources xkb-options "['caps:escape']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications-backward "['<Shift><Alt>Tab']"
gsettings set org.gnome.desktop.wm.keybindings switch-windows "['<Super>Tab']"
gsettings set org.gnome.desktop.wm.keybindings maximize "['<Super>Up']"
gsettings set org.gnome.desktop.wm.keybindings unmaximize "['<Super>Down']"

# Git
ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/gitignore_global ~/.gitignore

# Terminal (Gnome)
ln -s ~/.dotfiles/shell/ptyxis/caconka.palette ~/.local/share/org.gnome.Ptyxis/palettes/caconka.palette

# Terminal ghostty
# sudo dnf copr enable pgdev/ghostty
# sudo dnf install ghostty
# ln -s ~/.dotfiles/shell/ghostty ~/.config/ghostty

# Tools
sudo dnf install -y xclip neovim eza ripgrep fd-find fzf bat
mkidr -p ~/.tmux/plugins/tmp
mkidr -p ~/.config/tmux/scripts
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux package manager
ln -s ~/.dotfiles/shell/tmux/tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/shell/tmux/scripts/window-name.sh ~/.config/tmux/scripts/window-name.sh
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/ctags/ctags ~/.ctags
ln -s ~/.dotfiles/vim/virc ~/.virc
ln -s ~/.dotfiles/vim/virc ~/.vimrc

# Code dir config
mkdir ~/code
cd ~/code
git clone git@github.com:caconka/code-configs.git code-configs
mkdir ephemeral projects go
mkdir ~/code/go/bin
mkdir ~/ephemeral
ln -fs ~/.dotfiles/.editorconfig ~/

git clone git@github.com:caconka/notes.git ~/notes

# mise
sudo dnf copr enable jdxcode/mise
sudo dnf install mise

mise plugin add usage
mise use -g usage

mkdir -p ~/.config/mise
ln -fs ~/.dotfiles/mise/config.toml ~/.config/mise/config.toml

mise install

# idea
ln -s ~/.dotfiles/idea/.ideavimrc ~/
sudo ln -s ~/.dotfiles/idea/idea.conf /etc/sysctl.d/

# Docker
# sudo dnf install -y docker-cli containerd
# sudo systemctl start docker
# sudo groupadd docker
# sudo usermod -aG docker $USER
# newgrp docker
mkdir ~/.docker

# Podman
sudo dnf install -y podman-docker podman-compose
sudo touch /etc/containers/nodocker
systemctl --user enable --now podman.socket
mkdir ~/.config/containers
ln -s ~/.dotfiles/containers/containers.conf ~/.config/containers/containers.conf

# Redis -  Valkey
sudo dnf install -y valkey valkey-compat-redis

# TestContainers
ln -s ~/.dotfiles/testcontainers/testcontainers.properties ~/.testcontainers.properties

# VSCode
# sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
# echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\nautorefresh=1\ntype=rpm-md\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
# dnf check-update
# sudo dnf install code

# Bruno
flatpak install -y flathub com.usebruno.Bruno

# rpmfusion
sudo dnf install -y \
  https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1
sudo dnf update @core

# Brave
# sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo
# sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
# sudo dnf install -y brave-browser

# multimedia codecs
sudo dnf groupupdate multimedia sound-and-video
sudo dnf swap ffmpeg-free ffmpeg --allowerasing
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
# for firefox
# sudo dnf install ffmpeg-libs

# nvidia drivers
# sudo dnf install akmod-nvidia

# intel drivers
# sudo dnf install intel-media-driver

# Shell
ln -fs ~/.dotfiles/shell/profile ~/.shell/
ln -fs ~/.dotfiles/shell/aliases ~/.shell/
ln -fs ~/.dotfiles/shell/functions ~/.shell/

# Bash
ln -fs ~/.dotfiles/shell/bash/bashrc ~/.bashrc

# Zsh
# sudo dnf install -y zsh
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# ln -fs ~/.dotfiles/shell/zsh/zshrc ~/.zshrc
# ln -fs ~/.dotfiles/shell/zsh/patches.zsh ~/.oh-my-zsh/custom/patches.zsh

# Pure theme
# mkdir -p "$HOME/.zsh"
# git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"

# Fish
sudo dnf install -y fish
mkdir -p ~/.config/fish/completions
mkdir ~/.config/fish/functions
ln -fs ~/.dotfiles/shell/fish/aliases ~/.config/fish/
ln -fs ~/.dotfiles/shell/fish/config.fish ~/.config/fish/
ln -fs ~/.dotfiles/shell/fish/completions/* ~/.config/fish/completions/
ln -fs ~/.dotfiles/shell/fish/functions/* ~/.config/fish/functions/

mise completion fish > ~/.config/fish/completions/mise.fish

chsh -s $(which fish)

fish
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install edc/bass

# npm without sudo
# mkdir -p ~/.npm-global
# npm config set prefix ~/.npm-global

# Work script
./work.sh
