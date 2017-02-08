dotfiles
========

What I use for Mac/Ubuntu/ArchLinux

# vim
* [vim-plug](https://github.com/junegunn/vim-plug)
* [ctrlp](https://github.com/ctrlpvim/ctrlp.vim)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [youcompleteme](https://github.com/Valloric/YouCompleteMe)
* [easymotion](https://github.com/Lokaltog/vim-easymotion)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtreetabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-airline](https://github.com/bling/vim-airline)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [syntastic](https://github.com/scrooloose/syntastic)
* [vim-easytags](https://github.com/xolox/vim-easytags)
* [vim-misc](https://github.com/xolox/vim-misc)
* [vim-rails](https://github.com/tpope/vim-rails)
* [ag](https://github.com/rking/ag.vim)
* [typescript-vim](https://github.com/leafgarland/typescript-vim)
* [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [vim-jsx](https://github.com/mxw/vim-jsx)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-es6](https://github.com/isRuslan/vim-es6)
* [html5](https://github.com/othree/html5.vim)
* [vim-coffee-script](https://github.com/kchmck/vim-coffee-script)
* [vim-elixir](https://github.com/elixir/vim-elixir)
* [vim-slime](https://github.com/jpalardy/vim-slime)
* [vim-indexed-search](https://github.com/henrik/vim-indexed-search)
* [numbers.vim](https://github.com/myusuf3/numbers.vim)
* [how to actually use vim well](http://stackoverflow.com/questionj/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

Vim plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug).
Run the install script to autoinstall plugins on Vim load. `youcompleteme` and
`ag` have post-install steps that need to be ran to build YCM and install
required binaries; refer to respective repos for more.

This repo's vimrc will be without plugins to keep vim as vanilla as possible.
Plugins are available in init.vim for nvim but there are quite a few so if
working in large unirepo you will notice a significant slowdown.

To fix movement between vim panes on nvim when using <C-h> and iterm terminal
you might need to change the keybind with the following:
```shell
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
See [this](https://github.com/neovim/neovim/issues/2048#issuecomment-78045837)
for more info.

```shell
git clone https://github.com/jonwho/dotfiles ~/jonwho-dotfiles
cd ~/jonwho-dotfiles
chmod +x install.sh
./install.sh
```

## YouCompleteMe
YouCompleteMe is a great code completion plugin but requires some extra work to
install. Refer to [https://github.com/Valloric/YouCompleteMe](https://github.com/Valloric/YouCompleteMe) for installation notes.

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

# Quick ctags note
Need to run ctags command in the project root to update .vimtags so vim knows where them tags at.
```
ctags -R .
```

# Ag aka the silver searcher
Must install separately onto your system first otherwise ag.vim plugin won't find the executable.
Find it here [https://github.com/ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher).

# tmux
Use [tpm](https://github.com/tmux-plugins/tpm) to manage tmux plugins.

# tmux copy&paste
Using [tmux-yank](https://github.com/tmux-plugins/tmux-yank) through .tmux.conf plugin setup.
For OSX run ```brew install reattach-to-user-namespace``` to grab this for OSX.
For Linux use xclip, install it however for your distro.

# Babel/eslint/es6/React and etc
Get these globally.
```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
```

# Using vim-slime
* Open up two panes in a window (if you want REPL side-by-side)
* Open the REPL in the pane you wish to send text to.
* In that pane run `echo $TMUX_PANE` or `tmux run "echo #{pane_id}"` to get the pane id.
* In the pane with your vim editor run `:SlimeConfig` to name your selected pane. Then in the following prompt put in the pane id you found from earlier.
* Now highlight the text you want to REPL then press `<C-c><C-c>` to send it over. Friggin' cool!

Works really well for CoffeeScript, Ruby, OCaml, Python, Elixir. :toocool:

# TODO
* Make script less sucky e.g. remove fatal warnings
