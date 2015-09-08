dotfiles
========

What I use for Ubuntu/Arch Linux

# Vim
* [pathogen](https://github.com/tpope/vim-pathogen)
* [ctrlp](https://github.com/kien/ctrlp.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [youcompleteme](https://github.com/Valloric/YouCompleteMe)
* [easymotion](https://github.com/Lokaltog/vim-easymotion)
* [minibufexpl](https://github.com/fholgado/minibufexpl.vim)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [how to actually use vim well](http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

# Install
```shell
git clone https://github.com/jonwho/dotfiles ~/jonwho-dotfiles
cd ~/jonwho-dotfiles
chmod +x install.sh
./install.sh
```

## YouCompleteMe
YouCompleteMe is a great code completion plugin but requires some
extra work to install. Refer to
[https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for installation notes.

As of Ubuntu 14.04 LTS can now install YouCompleteMe with the package manager.
```
sudo apt-get install vim
sudo apt-get install vim-youcompleteme
sudo apt-get install vim-addon-manager
vam install youcompleteme
```

To install on Arch Linux run the following commands.
```
wget https://aur.archlinux.org/packages/vi/vim-youcompleteme-git/vim-youcompleteme-git.tar.gz
tar xzvf vim-youcompleteme-git.tar.gz
cd vim-youcompleteme
makepkg -s
sudo pacman -U vim-youcompleteme-git-*.tar.xz
```

# TODO
* Make script less sucky e.g. remove fatal warnings
