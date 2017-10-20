# dotfiles

What I use for Mac/Ubuntu/ArchLinux

## Install
```shell
git clone https://github.com/jonwho/dotfiles ~/jonwho-dotfiles
cd ~/jonwho-dotfiles
chmod +x install.sh
./install.sh
```

## Vim
See [VIM.md](VIM.md)

## tmux
Use [tpm](https://github.com/tmux-plugins/tpm) to manage tmux plugins.

## tmux copy&paste
Using [tmux-yank](https://github.com/tmux-plugins/tmux-yank) through .tmux.conf
plugin setup. For OSX run `brew install reattach-to-user-namespace` to grab this
for OSX. For Linux use xclip, install it however for your distro.

## Babel/eslint/es6/React/yarn and etc
Get these globally.
```
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
npm install -g yarn
```

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

## TODO
* Make script less sucky e.g. remove fatal warnings
