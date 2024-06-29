function fish_greeting -d "What's up, fish?"
    set_color $fish_color_autosuggestion
    uname -nmsr

    command -q uptime
    and command uptime

    set_color normal

    if set -q fish_private_mode
        echo "fish is running in private mode, history will not be persisted."
    end
end
