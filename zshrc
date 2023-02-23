#!/usr/bin/env zsh

# for profiling zsh
# https://unix.stackexchange.com/a/329719/27109
#zmodload zsh/zprof

GPG_TTY=$(tty)
export GPG_TTY

export ZSHCONFIG=${ZDOTDIR:-$HOME}/.zsh-config
ZSH_INIT=${ZSHCONFIG}/_init.sh

if [[ -s ${ZSH_INIT} ]]; then
  source ${ZSH_INIT}
else
  echo "Could not find the init script ${ZSH_INIT}"
fi

# https://gist.github.com/ctechols/ca1035271ad134841284
# https://carlosbecker.com/posts/speeding-up-zsh
autoload -Uz compinit

case $SYSTEM in
Darwin)
  if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ${ZDOTDIR:-$HOME}/.zcompdump(Nm-20)) ]; then
    compinit
  else
    compinit -C
  fi
  ;;
Linux)
  # not yet match GNU & BSD stat
  ;;
esac

add-zsh-hook -Uz chpwd(){ source <(tea -Eds) }  #tea
