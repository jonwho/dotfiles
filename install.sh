#!/bin/bash

echo "Copying current .vimrc and .bashrc files to old.vimrc and old.bashrc
respectively"
echo ""

# copy .vimrc to old.vimrc
cp ~/.vimrc ~/old.vimrc
# copy .bashrc to old.bashrc
cp ~/.bashrc ~/old.bashrc
# copy .tmux.conf to old.tmux.conf
echo "Done copying"
echo ""

echo "Replacing .vimrc and .bashrc with repo version"
echo ""

# replace .vimrc with repo of vimrc
cp ./vimrc ~/.vimrc
# replace .bashrc with repo version of bashrc
cp ./bashrc ~/.bashrc
# replace .tmux.conf with repo version of tmux.conf
cp ./tmux.conf ~/.tmux.conf
echo "Done replacing"
echo ""

echo "Install vim plugins to ~/.vim/bundle/"
echo ""

# install pathogen.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
  curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# copy vim plugins to bundle dir
cd ~/.vim/bundle

# add the plugins
git clone https://github.com/kien/ctrlp.vim
git clone https://github.com/scrooloose/nerdtree
git clone https://github.com/Lokaltog/vim-easymotion
#git clone https://github.com/fholgado/minibufexpl.vim
git clone https://github.com/tpope/vim-endwise
git clone https://github.com/Raimondi/delimitMate
git clone https://github.com/jistr/vim-nerdtree-tabs.git
git clone https://github.com/nanotech/jellybeans.vim.git
git clone https://github.com/scrooloose/nerdcommenter.git
git clone https://github.com/bling/vim-airline.git
git clone https://github.com/tpope/vim-fugitive.git
git clone https://github.com/scrooloose/syntastic.git
git clone https://github.com/xolox/vim-easytags.git
git clone https://github.com/xolox/vim-misc.git
git clone https://github.com/tpope/vim-rails.git
git clone https://github.com/rking/ag.vim.git

echo "Done installing vim plugins"
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
