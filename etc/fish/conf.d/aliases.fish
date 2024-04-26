# Source/load existents aliases
for _FILE in (ls "/etc/fish/aliases")
    test -r "/etc/fish/aliases/$_FILE" && source "/etc/fish/aliases/$_FILE" || echo "Cannot source $_FILE"
end
