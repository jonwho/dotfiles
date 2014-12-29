#!/bin/bash

echo "Copying current .vimrc and .bashrc files to old.vimrc and old.bashrc
respectively"
echo ""

# copy .vimrc to old.vimrc
cp ~/.vimrc ~/old.vimrc
# copy .bashrc to old.bashrc
cp ~/.bashrc ~/old.bashrc

echo "Replacing .vimrc and .bashrc with repo version"
echo ""

# replace .vimrc with repo of vimrc
cp ./vimrc ~/.vimrc
# replace .bashrc with repo version of bashrc
cp ./bashrc ~/.bashrc

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
git clone https://github.com/fholgado/minibufexpl.vim
git clone https://github.com/tpope/vim-endwise
git clone https://github.com/Raimondi/delimitMate

echo ""
echo "Done running install script!"
echo ""