. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export BASH_SILENCE_DEPRECATION_WARNING=1

. ~/.bashrc
