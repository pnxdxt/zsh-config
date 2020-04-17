# My ZSH Configurations

This configuration is for my macOS workstation and therefore contain some macOS-specific code and commands.

## Quick Start

```sh
# get to the home folder
$ cd
# pull the git repos
$ git clone https://github.com/pnodet/zsh-config.git ~/.zsh-config
# then link the startup files
$ zsh ~/.zsh-config/bootstrap.sh
```

Log out and login again!!!

In case you want to have private setting excluded from public Git repos, just create a file `.private.sh` in the home folder.

## Plugin Management

If your default shell is not `zsh`, make it zsh and open a new terminal and plugins will automatically start installing.

I use [zinit](https://github.com/zdharma/zinit) with Turbo Mode to accelerate the loading and checking of ZSH plugins. Thus, `zinit` will be install be installed via the `bootstrap.sh` script above.

## Credits

Forked from: https://github.com/tracphil/my-zsh
Refactored from: https://htr3n.github.io/2018/07/faster-zsh/

## License

<3 MIT License.
