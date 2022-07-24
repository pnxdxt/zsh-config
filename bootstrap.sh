#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

ZSHCONFIG=${HOME}/.zsh-config

function zsh_bootstrap() {
    # need zinit
    echo "Cloning zinit"
    mkdir -p ~/.zinit
    git clone https://github.com/zdharma/zinit.git ~/.zinit/bin

    echo "Link resource files to ${HOME}"
    ln -sf ${ZSHCONFIG}/zlogin ${HOME}/.zlogin
    ln -sf ${ZSHCONFIG}/zprofile ${HOME}/.zprofile
    ln -sf ${ZSHCONFIG}/zshenv ${HOME}/.zshenv
    ln -sf ${ZSHCONFIG}/zshrc ${HOME}/.zshrc
    echo "Done! Donwloading plugins, this may take a minute"
}

function zsh_cleanup() {
    echo "Clean up links to resource files at ${HOME}"
    rm -f ${HOME}/.zlogin ${HOME}/.zprofile ${HOME}/.zshenv ${HOME}/.zshrc
    echo "Done!"
}

zsh_cleanup && zsh_bootstrap
