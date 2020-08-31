#!/usr/bin/env zsh
# vim:syntax=zsh
# vim:filetype=zsh

# Define common system-wide configurations

# GNU ls aliases
# For macOS where GNU ls is installed via homebrew as `gls`
case $SYSTEM in
Darwin)
	if which gls >/dev/null 2>&1; then
		alias ls="gls --color=auto"
		alias ll="gls -l --color=auto"
	fi
	;;
Linux)
	alias ls='ls --color=auto'
	alias ll="ls -l --color=auto"
	;;
esac

function handle-multi-arguments() {
	if [ ! "$#" -gt 1 ]; then
		echo "Usage: $0 file1 file2 ..." >&2
		return -1
	fi
	for file in $@; do
		if [ -f $file ]; then
			echo -n $file
		fi
	done
	echo 'Done!'
}

# Check if running on macOS, otherwise stop here
[[ ! "x$SYSTEM" == "xDarwin" ]] && return

# /etc/zprofile is loaded and invokes
# /usr/libexec/path_helper that might slow down start-up.
# Better enter directly the content of /etc/paths.d here

# /etc/paths.d/40-XQuartz
export PATH=$PATH:/opt/X11/bin

export PATH=$PATH:/sbin
export PATH=$PATH:/usr/sbin

# /etc/paths.d/MacGPG2
export PATH=$PATH:/usr/local/MacGPG2/bin

# GNU Core Utils
# brew info coreutils
export PATH=/usr/local/opt/coreutils/libexec/gnubin:$HOME/usr/local/opt/coreutils/libexec/gnubin:$PATH

alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# scutil
alias sys.get.computername='scutil --get ComputerName'
alias sys.get.localhostname='scutil --get LocalHostName'
alias sys.get.hostname='scutil --get HostName'
alias sys.get.dns='scutil --dns'
alias sys.get.proxy='scutil --proxy'
alias sys.get.network.interface='scutil --nwi'

alias sys.uti.file='mdls -name kMDItemContentTypeTree '

alias lsregister='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'

# OS X's launchctl
alias launch.list='launchctl list '
alias launch.load='launchctl load '
alias launch.unload='launchctl unload '
alias launch.getenv='launchctl getenv '
alias launch.start='launchctl start '
alias launch.stop='launchctl stop '

alias sys.pkg.list='pkgutil --pkgs'

# show CPU info
alias sys.cpu='sysctl -n machdep.cpu.brand_string'

# Spotlight / Meta-data indexing (MDS)
# https://apple.stackexchange.com/q/87090/7647
# https://apple.stackexchange.com/q/63178/7647
alias spotlight.exclusion.show='sudo defaults read /.Spotlight-V100/VolumeConfiguration.plist Exclusions'
alias spotlight.exclusion.add='sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add '

alias spotlight.indexing.stop='sudo launchctl stop com.apple.metadata.mds'
alias spotlight.indexing.start='sudo launchctl start com.apple.metadata.md'
alias spotlight.indexing.restart='spotlight.indexing.stop && spotlight.indexing.start'
