# Bundle exec
alias be="bundle exec"

# Get week number
alias week='date +%V'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"


# Chromium
alias chromium-41="open -na /Applications/Chromium\ 41.app --args --disable-web-security --auto-open-devtools-for-tabs"
alias chromium-47="open -na /Applications/Chromium\ 47.app --args --disable-web-security --auto-open-devtools-for-tabs"
alias chromium-52="open -na /Applications/Chromium\ 52.app --args --disable-web-security --auto-open-devtools-for-tabs"
alias chrome="open -a /Applications/Google\ Chrome.app"
alias canary="open -a /Applications/Google\ Chrome\ Canary.app"
alias firefox="open -a /Applications/Firefox.app"

# Git
alias git-cleanup="git branch --merged | grep -v '\*\|master\|main\|develop' | xargs -n 1 git branch -d"
alias rnb='rename_branch'

# Show/hide desktop icons

alias desktopshow="defaults write com.apple.finder CreateDesktop -bool true && killfinder"
alias desktophide="defaults write com.apple.finder CreateDesktop -bool false && killfinder"