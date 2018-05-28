#!/bin/bash

# XFCE Configs

sudo pacman -Syy --noconfirm gnome-screensaver deepin-icon-theme arc-gtk-theme \
  blueberry

pacaur -Syy --noconfirm dockbarx vala-panel-appmenu-xfce-git

mkdir ~/.icons ~/.themes
rm -rf ~/.config/xfce4/xfconf/xfce-perchannel-xml

ln -s --force ~/.dotfiles/xfce-configs ~/.config/xfce4/xfconf/xfce-perchannel-xml
cp -r /usr/share/icons/deepin ~/.icons/

# Set in settings > session and startup > application autostart > add > command
xset b off
