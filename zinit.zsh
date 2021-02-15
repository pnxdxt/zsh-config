#!/usr/bin/env zsh

zinit ice wait"0a" atinit"ZINIT[COMPINIT_OPTS]=-C; zpcompinit; zpcdreplay" atload"_zsh_highlight" lucid
zinit light zdharma/fast-syntax-highlighting

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh" lucid
zinit light direnv/direnv

# A binary Zsh module which transparently and automatically compiles sourced scripts
module_path+=( "${HOME}/.zinit/bin/zmodules/Src" )
zmodload zdharma/zplugin &>/dev/null

# Prompt : https://github.com/starship/starship
zinit ice from"gh-r" as"command" atload'eval "$(starship init zsh)"'
zinit load starship/starship

export NVM_SYMLINK_CURRENT="true" # nvm use should make a symlink
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
zinit light lukechilds/zsh-nvm # This load nvm on first use of node, npm, etc

zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-completions

zinit ice wait blockf lucid atpull'zinit creinstall -q .'
zinit load zsh-users/zsh-autosuggestions

zinit ice wait"1" lucid
zinit load zdharma/history-search-multi-word

zinit ice wait"1" lucid
zinit light junegunn/fzf

zinit ice wait"2" lucid
zinit light djui/alias-tips

#zinit ice wait"0" lucid
# must load it otherwise bindkeys won't work
zinit light zsh-users/zsh-history-substring-search
