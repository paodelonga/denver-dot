function fish_user_keybindings --description 'Load fish user defined keybindings'
    bind \b 'backward-kill-word'
    bind \e\[3\;3~ 'kill-word'
end
