#!/bin/bash

echo "Copying current dotfiles to old.{dotfile} respectively"
echo ""

cp ~/.vimrc ~/old.vimrc
cp ~/.config/nvim/init.vim ~/old.init.vim
cp ~/.bashrc ~/old.bashrc
cp ~/.bash_profile ~/old.bash_profile
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
cp ./bash_profile ~/.bash_profile
cp ./tmux.conf ~/.tmux.conf
cp ./eslintrc.json ~/.eslintrc.json
cp ./bash_aliases ~/.bash_aliases
cp ./gitignore_global ~/.gitignore_global
echo "Done replacing"
echo ""

echo "Copy git-prompt.sh to ~/"
echo ""
cp ./git-prompt.sh ~/.git-prompt.sh
echo "Done copying"

echo "Downloading git-completion.bash"
curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
echo "Done downloading git-completion.bash"

echo "Install asdf"
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.8
echo "Done with asdf"

echo "Done running install script!"
echo ""
