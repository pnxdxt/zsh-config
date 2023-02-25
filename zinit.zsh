#!/usr/bin/env zsh

# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

# Don't bind these keys until ready
bindkey -r '^[[A'
bindkey -r '^[[B'
function __bind_history_keys() {
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
}

# History substring searching
zinit ice wait"0a" lucid atload'__bind_history_keys'
zinit light zsh-users/zsh-history-substring-search

zinit ice atclone"dircolors -b LS_COLORS > clrs.zsh" \
    atpull'%atclone' pick"clrs.zsh" nocompile'!' \
    atload'zstyle ":completion:*" list-colors “${(s.:.)LS_COLORS}”'
zinit light trapd00r/LS_COLORS

# autosuggestions, trigger precmd hook upon load
zinit ice wait"0a" lucid atload'_zsh_autosuggest_start'
zinit light zsh-users/zsh-autosuggestions

# Syntax highlighting
zinit ice wait"0a" lucid atinit'zpcompinit; zpcdreplay'
zinit light zdharma-continuum/fast-syntax-highlighting

# Tab completions
zinit ice wait"0a" lucid blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

zinit ice wait"0b" lucid
zinit load zdharma-continuum/history-search-multi-word

zinit ice wait"0c" lucid
zinit load agkozak/zsh-z

zinit ice as"command" from"gh-r"
zinit light junegunn/fzf-bin

zinit ice wait"0c" lucid
zinit pack"default+keys" for fzf

zinit ice wait"1" lucid
zinit light QuarticCat/zsh-smartcache

zinit ice wait"2" lucid
zinit light zpm-zsh/ssh

zinit ice wait"3" lucid
zinit light paulirish/git-open
