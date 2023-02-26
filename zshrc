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

#
# Completion enhancements
#
[[ ${TERM} != dumb ]] && () {
  # Load and initialize the completion system
  local zstats zold_dat
	local zcompdump=${ZDOTDIR:-${HOME}}/.zcompdump

  # Check if dumpfile is up-to-date by comparing the full path and
  # last modification time of all the completion functions in fpath.
  local -i zdump_dat=1
  local -r zcomps=(${^fpath}/^([^_]*|*~|*.zwc)(N))

	if (( ${#zcomps} )); then
    zmodload -F zsh/stat b:zstat
    zstat -A zstats +mtime ${zcomps}
  fi

  local -r znew_dat=${ZSH_VERSION}$'\0'${(pj:\0:)zcomps}$'\0'${(pj:\0:)zstats}
  if [[ -e ${zcompdump}.dat ]]; then
    zmodload -F zsh/system b:sysread
    sysread -s ${#znew_dat} zold_dat <${zcompdump}.dat
    [[ ${zold_dat} == ${znew_dat} ]]; zdump_dat=${?}
  fi

  if (( zdump_dat )) command rm -f ${zcompdump}(|.dat|.zwc(|.old))(N)

	autoload -Uz compinit && compinit -C -d ${zcompdump}

	if [[ ! ${zcompdump}.dat -nt ${zcompdump} ]]; then
		>! ${zcompdump}.dat <<<${znew_dat}
	fi

	# Compile the completion dumpfile; significant speedup
	if [[ ! ${zcompdump}.zwc -nt ${zcompdump} ]] zcompile ${zcompdump}
}

# zprof
