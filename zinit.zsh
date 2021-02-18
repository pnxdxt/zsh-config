#!/usr/bin/env zsh

# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE

turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zcommand() { zinit ice wait"0b" lucid as"command" "${@}"; }
zload()    { zinit load                           "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh" lucid
zinit light direnv/direnv

# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

#zinit ice wait"0" lucid
# must load it otherwise bindkeys won't work
zinit light zsh-users/zsh-history-substring-search

# A binary Zsh module which transparently and automatically compiles sourced scripts
module_path+=( "${HOME}/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin &>/dev/null

zinit ice wait"0a" atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" atload"_zsh_highlight" lucid
zinit load zsh-users/zsh-completions

zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit light zdharma/fast-syntax-highlighting

zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-autosuggestions

zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

zinit ice wait"1" lucid
zinit light junegunn/fzf

zinit ice wait"2" lucid
zinit light djui/alias-tips