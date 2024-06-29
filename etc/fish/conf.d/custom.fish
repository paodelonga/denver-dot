# source initializer
test -r "/etc/fish/custom/init.fish" &&
    source "/etc/fish/custom/init.fish" ||
    echo "cannot source init.fish"

