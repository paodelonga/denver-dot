# if status is-login
    # if test -z "$DISPLAY" -a "$XDG_VTNR" = 1 -a -z "$SSH_CONNECTION"
        # exec startx -- -keeptty > ~/.xorg.log 2>&1
    # end
# end

if status is-interactive
    # Add directories to PATH
    set PATH "$PATH:/usr/sbin/"
    set PATH "$PATH:/usr/local/sbin"
    set PATH "$PATH:/usr/local/bin"
end
