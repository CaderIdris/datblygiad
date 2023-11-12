#!/bin/sh

cd $HOME
chsh -s zsh $USER
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

chezmoi init
chezmoi cd
git remote add origin https://github.com/CaderIdris/dotfiles.git
git pull origin main
cd $HOME
chezmoi apply -v

nvim --headless -c 'autocmd User PackerSync quitall'
nvim --headless -c 'autocmd User LspInstall quitall'
nvim --headless -c 'autocmd User COQDeps quitall'
