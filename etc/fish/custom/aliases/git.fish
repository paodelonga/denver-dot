alias gst="git status"
alias ga="git add"
alias gai="git add -i"
alias gae="git add -e"
alias gap="git add -p"
alias gdf="git diff"
alias gdsf="git dsf"
alias gps="git push"
alias gpl="git pull"

alias gb="git branch"
alias gba="git branch --all"
alias gbl="git branch --list"
alias gbc="git branch --copy"
alias gbm="git branch --move"
alias gbd="git branch --delete"
alias gbnmp='echo "<group>.<subject>.<""$(uuidgen -r | cut -d '-' -f -1)""|commit_tag>.[username]"'

alias gf="git fetch"
alias gfa="git fetch --all"
alias gfp="git fetch --prune"
alias gfap="git fetch --all --prune"

alias gc="git commit"
alias gcm="git commit -m"

alias gchku="git reset HEAD~1 --mixed"
alias gchkc="git commit -m 'checkpoint: $(uuidgen -r)'"

alias gsw="git switch"
alias gswc="git switch -c"
alias gswo="git switch --orphan"

alias glog='git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30'
