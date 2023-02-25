#!/usr/bin/env zsh

if which lvim >/dev/null 2>&1; then
  alias vi=lvim
  alias vim=lvim
  alias nvim=lvim
fi

# Enable aliases to be sudo’ed
alias sudo='sudo '

# Undollar
alias \$=''

# change dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias cdd='dirs -v && read index && let "index=$index+0" && cd ~"$index" && let "index=$index+1" && popd -q +"$index"'

alias :e=vim
alias c='clear'

alias ls='exa'
alias lsa='ls -a'
alias lsd='ls -d .*'
alias l='ll'
alias ll='ls -lFh'       # long (-l), types classify (-F),human readable (-h)
alias ls.all='ls -lAFh'  # long list, show almost all
alias ls.dot='ls -ld .*' # show dot files, list dirs non-recursively (-d)
alias ls.id='ls -nFh'    # show numeric FID and GID (-n)
alias ls.sort.time='ls -tlFh'
alias ls.sort.size='ls -SlFh'
alias ls.recursive='ls -R'

alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nk='npm link'
alias nr='npm run'
alias nrf='npm run format'
alias ns='npm start'
alias nf='npm cache clean && rm -rf node_modules && npm install'
alias nlg='npm list --global --depth=0'

alias y='yarn'
alias ya='yarn add'
alias yad='yarn add --dev'
alias yr='yarn run'

alias g="git"

alias gpgfix="export GPG_TTY=$(tty)"

alias o="open"
alias oo="open ."
alias co="code ."

alias diff='colordiff' # diff

alias ssh="ssh -A" # Remote

alias myip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\  -f2'
alias speedtest='fast -u --single-line'
alias meteo="curl -4 http://wttr.in/Paris"
alias week='date +%V'          # Get week number
alias cdate='date "+%d—%m—%Y"' # Get date

alias reload="exec zsh"

# DNS cache Flush
alias dnscacheflush="sudo killall -HUP mDNSResponder"
alias dnscf="sudo killall -HUP mDNSResponder"
alias dcf="sudo killall -HUP mDNSResponder"

alias generate-password="repeat 10 {openssl rand -base64 18}"
alias brew_update="brew -v update; brew upgrade --force-bottle; brew cleanup; brew doctor"
