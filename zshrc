#!/usr/bin/env zsh

# for profiling zsh
# https://unix.stackexchange.com/a/329719/27109
# zmodload zsh/zprof

GPG_TTY=$(tty)
export GPG_TTY
export CLICOLOR=1

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

tea() {
	source <(tea -Eds)
}

fetch() {
	emulate -L zsh
  set -- "$(git rev-parse --show-toplevel 2>/dev/null)"
  # If cd'ing into a git working copy and not within the same working copy
  if [ -n "$1" ] && [ "$1" != "$vc_root" ]; then
		vc_root="$1"
		last_commit=$(git --no-pager log -1 --format="%at")
		one_day_ago=$(date -v -1d '+%s')
		if (($last_commit < $one_day_ago)); then
			echo "Fetching..."
  		git fetch --quiet
		fi
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd tea
add-zsh-hook chpwd fetch

# zprof
