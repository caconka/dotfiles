#!/bin/bash

# XFCE Configs

sudo pacman -Syy --noconfirm gnome-screensaver deepin-icon-theme arc-gtk-theme \
  dockbarx vala-panel-appmenu-xfce-git

mkdir ~/.icons ~/.themes
rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml

ln -s --force ~/.dotfiles/xfce-configs ~/.config/xfce4/xfconf/xfce-perchannel-xml

