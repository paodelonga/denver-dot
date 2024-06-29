# if status is-login
#     if test -z "$DISPLAY" -a "$XDG_VTNR" = 1 -a -z "$SSH_CONNECTION"
#         exec startx -- -keeptty >~/.Xorg.0.log 2>&1
#     end
# end

if status is-interactive
    # exporting new directories to PATH
end
