# -*- mode: zsh -*-

export PROJECTS_DIR=$HOME/Projects

# GRC colorizes nifty unix tools all over the place
if which gls >/dev/null 2>&1; then
  source $(brew --prefix)/etc/grc.bashrc
fi

if which nvim >/dev/null 2>&1; then
  alias vi=nvim
fi

alias ssh="ssh -A"

# what is my ip?
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killchrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# Get week number
alias week='date +%V'

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle --cleanup; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'

alias path='echo -e ${PATH//:/\\n}'
