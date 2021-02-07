# -*- mode: zsh -*-

export PROJECTS_DIR=$HOME/Projects

# GRC colorizes nifty unix tools all over the place
if which gls >/dev/null 2>&1; then
  source $(brew --prefix)/etc/grc.bashrc
fi

if which nvim >/dev/null 2>&1; then
  alias vi=nvim
fi

alias lsa='ls -a'
alias lsd='ls -d .*'
alias l='ll'
alias ll='ls -lFh'       # long (-l), types classify (-F),human readable (-h)
alias ls.all='ls -lAFh'  # long list, show almost all
alias ls.dot='ls -ld .*' # show dot files, list dirs non-recursively (-d)
alias ls.id='ls -nFh'    # show numeric FID and GID (-n)
alias ls.sort.time='ls -tlFh'
alias ls.sort.size='ls -SlFh'
alias ls.recursive='ls -R'

alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install --global'
alias nt='npm test'
alias nit='npm install && npm test'
alias nk='npm link'
alias nr='npm run'
alias ns='npm start'
alias nf='npm cache clean && rm -rf node_modules && npm install'
alias nlg='npm list --global --depth=0'

alias g="git"
alias o="open ."

# diff
alias diff='colordiff'

# change dir
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../../..'

alias ssh="ssh -A" # Remote
alias ssh.vizapp="ssh ubuntu@51.210.180.245"

alias myip='dig +short myip.opendns.com @resolver1.opendns.com' # what is my ip?
alias speedtest='fast -u --single-line && speed-test -v'

# Funny commit
alias yolo="git commit -am '$(curl -s http://whatthecommit.com/index.txt)'"

# Kill all the tabs in Chrome to free up memory
# [C] explained: http://www.commandlinefu.com/commands/view/402/exclude-grep-from-your-grepped-output-of-ps-alias-included-in-description
alias killchrome="ps ux | grep '[C]hrome Helper --type=renderer' | grep -v extension-process | tr -s ' ' | cut -d ' ' -f2 | xargs kill"

# Lock the screen (when going AFK)
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

alias week='date +%V'          # Get week number
alias cdate='date "+%d—%m—%Y"' # Get date
alias timer='date1=`date +%s`; while true; do 
   echo -ne "$(date -u --date @$((`date +%s` - $date1)) +%H:%M:%S)\r";
done'

# Update installed Ruby gems, Homebrew, npm, and their installed packages
alias brew_update="brew -v update; brew upgrade --force-bottle; brew cleanup; brew cask cleanup; brew prune; brew doctor; npm-check -g -u"
alias update_brew_npm_gem='brew_update; npm install npm -g; npm update -g; sudo gem update --system; sudo gem update --no-document'

# Echo path
alias path='echo -e ${PATH//:/\\n}'

# DNS cache Flush
alias dnscacheflush="sudo killall -HUP mDNSResponder"
alias dnscf="sudo killall -HUP mDNSResponder"
alias dcf="sudo killall -HUP mDNSResponder"

alias $=" "

generate-password() {
  strings /dev/urandom | grep -o '[[:alnum:]]' | head -n $1 | tr -d '\n'; echo
}