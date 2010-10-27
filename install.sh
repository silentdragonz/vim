#!/bin/bash
echo "Installing vim files."
cd ~
git clone https://silentdragonz@github.com/silentdragonz/vim.git ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

echo "Downloading vim bundles."
cd ~/.vim
git submodule init
git submodule update

echo "Done."
