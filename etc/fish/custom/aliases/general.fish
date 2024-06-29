alias ..="cd .."
alias ...="cd ../.."

alias cp="cp -r"
alias mkdir="mkdir -pv"
alias df="df -h"
alias wget="wget -c"
alias free="free -m"

alias dir='dir --color=aauto'
alias vdir='vdir --color=auto'
alias ls="ls --color=auto --group-directories-first --human-readable"
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias l="ls"
alias la="ls -a"
alias ll="ls -l"
alias lla="ls -la"
alias lal="ls -la"
alias sul="su -"

alias eza="eza --git --group-directories-first -g"
alias e="eza"
alias ea="eza -a"
alias el="eza -l"
alias eal="eza -al"
alias ela="eza -al"
alias et="eza -T"
alias eta="eza -Ta -I '.venv|.git'"
alias etl="eza -Tl"
alias etla="eza -Tla -I '.venv|.git'"

alias dfree="df -Th --total"
alias mfree="free -lthw"
alias gip="curl -s ipecho.net/plain; echo -e; hostname -i"

alias chour="date +%H:%M:%S"
alias cdate='date "+%A, %B %d, %Y"'
alias crev='date "+%A, %d %B, %Y - %T"'
alias csrev='date "+%d/%m/%Y - %T"'
alias cbkp='date "+%Y.%m.%d-%H_%M_%S"'

alias c="clear && greeting"
alias suuid4="uuidgen -r | cut -d '-' -f -1"
alias src="omf reload"
alias code="vscodium"
