# NEOVIM/VIM

* [vim-plug](https://github.com/junegunn/vim-plug)
* [nerdtree](https://github.com/scrooloose/nerdtree)
* [vim-endwise](https://github.com/tpope/vim-endwise)
* [indentLine](https://github.com/Yggdroot/indentLine)
* [delimitMate](https://github.com/Raimondi/delimitMate)
* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)
* [vim-airline](https://github.com/bling/vim-airline)
* [vim-fugitive](https://github.com/tpope/vim-fugitive)
* [vim-easytags](https://github.com/xolox/vim-easytags)
* [vim-misc](https://github.com/xolox/vim-misc)
* [vim-rails](https://github.com/tpope/vim-rails)
* [vim-better-whitespace](https://github.com/ntpeters/vim-better-whitespace)
* [vim-javascript](https://github.com/pangloss/vim-javascript)
* [yats](https://github.com/HerringtonDarkholme/yats.vim)
* [vim-jsx-pretty](https://github.com/maxmellon/vim-jsx-pretty)
* [vim-surround](https://github.com/tpope/vim-surround)
* [vim-repeat](https://github.com/tpope/vim-repeat)
* [vim-vinegar](https://github.com/tpope/vim-vinegar)
* [html5](https://github.com/othree/html5.vim)
* [vim-elixir](https://github.com/elixir/vim-elixir)
* [vim-slime](https://github.com/jpalardy/vim-slime)
* [vim-colorschemes](https://github.com/flazz/vim-colorschemes)
* [vim-indexed-search](https://github.com/henrik/vim-indexed-search)
* [numbers.vim](https://github.com/myusuf3/numbers.vim)
* [cql-vim](https://github.com/elubow/cql-vim)
* [vim-easy-align](https://github.com/junegunn/vim-easy-align)
* [fzf.vim](https://github.com/junegunn/fzf.vim)
* [ale](https://github.com/w0rp/ale)
* [vim-go](https://github.com/fatih/vim-go)
* [vim-rspec](https://github.com/thoughtbot/vim-rspec)
* [vim-css-color](https://github.com/ap/vim-css-color)
* [vim-signature](https://github.com/kshenoy/vim-signature)
* [space-vim](https://github.com/liuchengxu/space-vim-dark)
* [goyo](https://github.com/junegunn/goyo.vim)
* [how to actually use vim well](http://stackoverflow.com/questionj/1218390/what-is-your-most-productive-shortcut-with-vim/1220118#1220118)

Vim plugins are managed by [vim-plug](https://github.com/junegunn/vim-plug).
Run the install script to autoinstall plugins on Vim load. `ag` has 
binaries or requirements that need to be met in order to install and use.

This repo's vimrc uses fewer plugins than nvim's init.vim to keep vim as vanilla
as possible. Plugins are available in init.vim for nvim but there are quite a
few so if working in large unirepo you might notice a significant slowdown.

## Quick ctags note
Need to run ctags command in the project root to update .vimtags so vim knows
where them tags at.
```
ctags -R .
```
[vim-easytags](https://github.com/xolox/vim-easytags) will auto-regenerate tags as you edit files
in your project so you don't have to manually update.

## the_silver_searcher
Must install separately onto your system first otherwise fzf.vim plugin won't
find the executable. Find it here [https://github.com/ggreer/the_silver_searcher](https://github.com/ggreer/the_silver_searcher).
This lets you run the ex command `:Ag` to search patterns within files.

## Workflow
* Use multiple buffers and windows to work on related problem.
* Create another tab if working on something separate. (one buffer per tab is inefficient workflow)

## Using vim-slime
* Open up two panes in a window (if you want REPL side-by-side)
* Open the REPL in the pane you wish to send text to.
* In that pane run `echo $TMUX_PANE` or `tmux run "echo #{pane_id}"`
to get the pane id.
* In the pane with your vim editor run `:SlimeConfig` to name your selected
pane. Then in the following prompt put in the pane id you found from earlier.
* Now highlight the text you want to REPL then press `<C-c><C-c>` to send it
over. Friggin' cool!

Works really well for CoffeeScript, Ruby, OCaml, Python, Elixir. :toocool:
