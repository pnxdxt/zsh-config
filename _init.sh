#!/usr/bin/env zsh

if [[ "x$SYSTEM" = "xDarwin" ]]; then
	# local system binaries
	export PATH=/usr/local/sbin:/usr/local/bin:$PATH
	export PATH=/opt/homebrew/sbin:/opt/homebrew/bin:$PATH
fi

# Non-default homebrew install
export PATH=$PATH:$HOME/usr/local/bin:$HOME/.local/bin

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# bootstrap the zinit script
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
	print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
	command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
	command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" &&
		print -P "%F{33} %F{34}Installation successful.%f%b" ||
		print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit

# and load the plugins
source "$HOME/.zsh-config/zinit.zsh"

# Starship prompt
export STARSHIP_CONFIG=~/.config/starship.toml

#-----------------------------------------------------
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_paths=${ZSHCONFIG}/paths
if [[ -d "$my_zsh_paths" ]]; then
	for file in $my_zsh_paths/*.zsh; do
		source $file
	done
fi
unset my_zsh_paths

#-----------------------------------------------------
# Load all scripts ${ZSHCONFIG}/lib/*.zsh
#
my_zsh_lib=${ZSHCONFIG}/lib
if [[ -d "$my_zsh_lib" ]]; then
	for file in $my_zsh_lib/*.zsh; do
		source $file
	done
fi
unset my_zsh_lib

#-----------------------------------------------------
# Setting autoloaded functions
#
my_zsh_fpath=${ZSHCONFIG}/autoloaded
fpath=($my_zsh_fpath $fpath)

if [[ -d "$my_zsh_fpath" ]]; then
	for func in $my_zsh_fpath/*; do
		autoload -Uz ${func:t}
	done
fi
unset my_zsh_fpath

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH
