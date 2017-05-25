#!/bin/bash

echo "Copying current dotfiles to old.{dotfile} respectively"
echo ""

# copy .vimrc to old.vimrc
cp ~/.vimrc ~/old.vimrc
# copy init.vim to old.init.vim
cp ~/.config/nvim/init.vim ~/old.init.vim
# copy .bashrc to old.bashrc
cp ~/.bashrc ~/old.bashrc
# copy .tmux.conf to old.tmux.conf
cp ~/.tmux.conf ~/old.tmux.conf
# copy .eslintrc.json to old.eslintrc.json
cp ~/.eslintrc.json ~/old.eslintrc.json
echo "Done copying"
echo ""

echo "Replacing dotfiles repo version"
echo ""

# replace .vimrc with repo version of vimrc
cp ./vimrc ~/.vimrc
# replace .init.vim with repo version of vimrc
cp ./init.vim ~/.config/nvim/init.vim
# replace .bashrc with repo version of bashrc
cp ./bashrc ~/.bashrc
# replace .tmux.conf with repo version of tmux.conf
cp ./tmux.conf ~/.tmux.conf
# replace .eslintrc.json with repo version of eslintrc.json
cp ./eslintrc.json ~/.eslintrc.json
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
