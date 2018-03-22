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
```shell
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-react
npm install -g yarn
```

## TODO
* Make script less sucky e.g. remove fatal warnings
