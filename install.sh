#!/bin/bash

echo "Copying current dotfiles to old.{dotfile} respectively"
echo ""

cp ~/.vimrc ~/old.vimrc
cp ~/.config/nvim/init.vim ~/old.init.vim
cp ~/.bashrc ~/old.bashrc
cp ~/.tmux.conf ~/old.tmux.conf
cp ~/.eslintrc.json ~/old.eslintrc.json
cp ~/.bash_aliases ~/old.bash_aliases
echo "Done copying"
echo ""

echo "Replacing dotfiles repo version"
echo ""

cp ./vimrc ~/.vimrc
cp ./init.vim ~/.config/nvim/init.vim
cp ./bashrc ~/.bashrc
cp ./tmux.conf ~/.tmux.conf
cp ./eslintrc.json ~/.eslintrc.json
cp ./bash_aliases ~/.bash_aliases
echo "Done replacing"
echo ""

echo "Copy git-prompt.sh to ~/"
echo ""
cp ./git-prompt.sh ~/.git-prompt.sh
echo "Done copying"

# Getting can't stat error on Arch Linux
#echo "Copy git-autocomplete script"
#cp git-completion.bash ~/.git-completion.bash
#echo "Done"
#echo ""

echo "Done running install script!"
echo ""
