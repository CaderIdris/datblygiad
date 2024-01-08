#!/bin/bash

mkdir /tmp/yay
cd /tmp/yay
git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si --noconfirm
yay --save --answerclean All --answerdiff All
yay --save --nocleanmenu --nodiffmenu
