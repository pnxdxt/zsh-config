#!/usr/bin/env zsh

# FUNCTIONS TO MAKE CONFIGURATION LESS VERBOSE
turbo0()   { zinit ice wait"0a" lucid             "${@}"; }
turbo1()   { zinit ice wait"0b" lucid             "${@}"; }
turbo2()   { zinit ice wait"0c" lucid             "${@}"; }
zcommand() { zinit ice wait"0b" lucid as"command" "${@}"; }
zload()    { zinit load                           "${@}"; }
zlight()   { zinit light                          "${@}"; }
zsnippet() { zinit snippet                        "${@}"; }

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh" lucid
zlight direnv/direnv

# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zload starship/starship

# Don't bind these keys until ready
bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# History substring searching
turbo0 atload'__bind_history_keys'
zlight zsh-users/zsh-history-substring-search

# autosuggestions, trigger precmd hook upon load
turbo0 atload'_zsh_autosuggest_start'
zlight zsh-users/zsh-autosuggestions

# Tab completions
turbo0 blockf atpull'zinit creinstall -q .'
zlight zsh-users/zsh-completions

# Syntax highlighting
turbo0 atinit'zpcompinit; zpcdreplay'
zlight zdharma/fast-syntax-highlighting

turbo1; zload zdharma/history-search-multi-word

turbo2; zlight junegunn/fzf

turbo2; zlight djui/alias-tips

# REMOVE TEMPORARY FUNCTIONS
unset -f turbo0
unset -f turbo1
unset -f turbo2
unset -f zload
unset -f zlight
