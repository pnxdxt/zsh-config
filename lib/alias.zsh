# -*- mode: zsh -*-

export PROJECTS_DIR=$HOME/Projects

# GRC colorizes nifty unix tools all over the place
if which gls >/dev/null 2>&1; then
  source $(brew --prefix)/etc/grc.bashrc
fi

if which nvim >/dev/null 2>&1; then
  alias vi=nvim
fi

alias ssh="ssh -A"

# what is my ip?
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
