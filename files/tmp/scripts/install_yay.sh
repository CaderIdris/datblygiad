#!/bin/bash
echo "Switching directory"
mkdir /tmp/yay
cd /tmp/yay
echo "Cloning Repo"
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
echo "Building yay"
makepkg -si --noconfirm
yay --save --answerclean All --answerdiff All
yay --save --cleanmenu=false --diffmenu=false
