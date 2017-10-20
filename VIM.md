# Vim

* [vim-plug](https://github.com/junegunn/vim-plug)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [easymotion](https://github.com/Lokaltog/vim-easymotion)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [nerdtreetabs](https://github.com/jistr/vim-nerdtree-tabs)
* [vim-airline](https://github.com/bling/vim-airline)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-easytags](https://github.com/xolox/vim-easytags)
* [vim-misc](https://github.com/xolox/vim-misc)
* [vim-rails](https://github.com/tpope/vim-rails)
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
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
* [vim-indexed-search](https://github.com/henrik/vim-indexed-search)
* [numbers.vim](https://github.com/myusuf3/numbers.vim)
* [deoplete.nvim](https://github.com/Shougo/deoplete.nvim)
* [cql-vim](https://github.com/elubow/cql-vim)
* [vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [ale](https://github.com/w0rp/ale)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-rspec](https://github.com/thoughtbot/vim-rspec)
* [how to actually use vim well](http://stackoverflow.com/questionj/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

Vim plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug).
Run the install script to autoinstall plugins on Vim load. `ag` and `deoplete`
have binaries or requirements that need to be met in order to install and use.

This repo's vimrc uses fewer plugins than nvim's init.vim to keep vim as vanilla
as possible. Plugins are available in init.vim for nvim but there are quite a
few so if working in large unirepo you might notice a significant slowdown.

To fix movement between vim panes on nvim when using <C-h> and iterm2 terminal
you might need to change the keybind with the following:
```shell
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
```
See [this](https://github.com/neovim/neovim/issues/2048#issuecomment-78045837)
for more info.

## deoplete
deoplete is for neovim only. Make sure you meet the requirements first before
installing deoplete. Check [deoplete](https://github.com/Shougo/deoplete.nvim)
for more.

## Quick ctags note
Need to run ctags command in the project root to update .vimtags so vim knows
where them tags at.
```
ctags -R .
```

## the_silver_searcher
Must install separately onto your system first otherwise fzf.vim plugin won't
find the executable. Find it here [https://github.com/ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher).

