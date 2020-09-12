#!/usr/bin/env zsh
# vim:syntax=sh
# vim:filetype=sh

if [[ "x$SYSTEM" = "xDarwin" ]]; then
    # system executables
    #export PATH=$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/libexec
    # local system binaries
    export PATH=/usr/local/sbin:/usr/local/bin:$PATH
fi

# Non-default homebrew install
export PATH=$PATH:$HOME/usr/local/bin

#-----------------------------------------------------
# ensure to only execute on ZSH
# https://stackoverflow.com/a/9911082/339302
[ ! -n "$ZSH_VERSION" ] && return

#-----------------------------------------------------
# bootstrap the zinit script
#
source "$HOME/.zinit/bin/zinit.zsh"

# and load the plugins
source "$HOME/.zsh-config/zinit.zsh"
#-----------------------------------------------------

# https://github.com/sindresorhus/pure#options
export PURE_PROMPT_SYMBOL='❯'
export PURE_CMD_MAX_EXEC_TIME=4

# https://typewritten.dev/#/prompt_customization

export TYPEWRITTEN_PROMPT_LAYOUT="pure"
export TYPEWRITTEN_CURSOR="beam"
export TYPEWRITTEN_COLOR_MAPPINGS="primary:#9580FF;secondary:#8AFF80;accent:#FFFF80;info_negative:#FF80BF;info_positive:#8AFF80;info_neutral_1:#FF9580;info_neutral_2:#FFFF80;info_special:#80FFEA"


# https://github.com/denysdovhan/spaceship-prompt/blob/master/docs/Options.md
export SPACESHIP_VI_MODE_SHOW=false
export SPACESHIP_BATTERY_SHOW=charged


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
#
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
# Development stuffs
#
dev_config_init=${SCRIPTS}/dev-config/_init.sh

[[ -f "$dev_config_init" ]] && source "$dev_config_init"

unset dev_config_init

#-----------------------------------------------------
# after all, set the PATH for macOS
[[ -x /bin/launchctl ]] && /bin/launchctl setenv PATH $PATH
