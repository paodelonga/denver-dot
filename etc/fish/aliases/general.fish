alias ..="cd .."
alias ...="cd ../.."

alias free="free -m"
alias wget="wget -c"

alias dir='dir --color=never'
alias vdir='vdir --color=never'
alias cp="cp -r"
alias rm="rm -i"
alias mkdir="mkdir -pv"
alias df="df -h"
alias ls="ls --color=never --group-directories-first --human-readable"
alias grep='grep --color=never'
alias fgrep='fgrep --color=never'
alias egrep='egrep --color=never'

alias l="ls"
alias ll="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lal="ls -la"
alias sul="su -"

alias eza="eza --git --group-directories-first -g"
alias e="eza"
alias ea="eza -a"
alias eal="eza -al"
alias el="eza -l"
alias ela="eza -al"
alias et="eza -T"
alias eta="eza -Ta -I '.venv|.git'"
alias etl="eza -Tl"
alias etal="eza -Tla -I '.venv|.git'"

alias c="clear && fish_greeting"
alias dfree="df -Th --total"
alias mfree="free -lthw"
alias gip="curl -s ipecho.net/plain; echo -e; hostname -i"

alias cstat="stat --printf '%a/%A; %F; %n\n'"
alias 000="chmod 000"
alias 640="chmod 640"
alias 644="chmod 644"
alias 755="chmod 755"
alias 775="chmod 775"
alias 777="chmod 777"
alias ux+="chmod u+x"
alias ax+="chmod a+x"
alias ux-="chmod u-x"
alias ax-="chmod a-x"

alias chour="date +%H:%M:%S"
alias cdate='date "+%A, %B %d, %Y"'
alias crev='date "+%A, %d %B, %Y - %T"'
alias csrev='date "+%d/%m/%Y - %T"'
alias cbkp='date "+%Y.%m.%d-%H_%M_%S"'
alias cal3="cal -n 3"
alias cal6="cal -n 6"
alias caly="cal -y"

alias suuid4="uuid -v4 | cut -d '-' -f -1"

alias nvk='NVIM_APPNAME="nvim-kickstart" nvim'
alias nvc='NVIM_APPNAME="nvim-venci" nvim'
alias nv="nvim"

alias dk="docker"
alias lz="lazygit"
alias src="omf reload"
alias fish_priv="fish --private"
