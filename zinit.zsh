#!/usr/bin/env zsh

# https://github.com/zdharma/zinit/wiki
# https://github.com/zdharma/zinit/blob/master/GALLERY.md
zinit ice wait"0" atload"_zsh_autosuggest_start" lucid
zinit light zsh-users/zsh-autosuggestions

zinit ice wait"0" lucid
zinit light zsh-users/zsh-completions

#zinit light zsh-users/zsh-syntax-highlighting
zinit ice wait"3" atinit"zpcompinit; zpcdreplay" lucid
zinit light zdharma/fast-syntax-highlighting

zinit ice wait"0" lucid
zinit light djui/alias-tips

zinit ice as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' atpull'%atclone' pick"direnv" src"zhook.zsh" lucid
zinit light direnv/direnv

#zinit ice wait"0" lucid
# must load it otherwise bindkeys won't work
zinit light zsh-users/zsh-history-substring-search

zinit ice wait"0" lucid
zinit load zdharma/history-search-multi-word

zinit ice wait"0" lucid
zinit light junegunn/fzf

#zinit light mafredri/zsh-async
# Load the pure theme, with zsh-async library that's bundled with it
zplugin ice pick"async.zsh" src"pure.zsh" lucid
zplugin light sindresorhus/pure

zinit ice as"completion" lucid

# zinit snippet https://github.com/docker/cli/blob/master/contrib/completion/zsh/_docker
# zinit as'completion' for OMZ::plugins/docker/_docker

# OMZ Plugins
# https://github.com/zdharma/zinit/blob/master/doc/INTRODUCTION.adoc#oh-my-zsh-prezto
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins
#
#zinit ice wait"0" lucid
#zinit snippet OMZ::plugins/python/python.plugin.zsh
#zinit ice wait"0" lucid
#zinit snippet OMZ::plugins/ruby/ruby.plugin.zsh
#zinit snippet OMZ::plugins/pyenv/pyenv.plugin.zsh
#zinit snippet OMZ::plugins/terraform/terraform.plugin.zsh
#zinit snippet OMZ::plugins/vscode/vscode.plugin.zsh
#zinit snippet OMZ::plugins/ansible/ansible.plugin.zsh
#zinit snippet OMZ::plugins/nvm/nvm.plugin.zsh
#zinit snippet OMZ::plugins/vagrant/vagrant.plugin.zsh
#zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh

# NOTE: AWS completion is already in place with pyenv installation
# zinit snippet OMZ::plugins/aws/aws.plugin.zsh

#
# Prezto Plugins
# https://github.com/sorin-ionescu/prezto/blob/master/modules
#
# zinit snippet PZT::modules/python/init.zsh
