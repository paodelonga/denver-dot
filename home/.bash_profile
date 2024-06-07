#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ] && [ -z "$SSH_CONNECTION" ]; then
	exec startx -- -keeptty > $HOME/.local/share/xorg/Xorg.log 2>&1
fi
