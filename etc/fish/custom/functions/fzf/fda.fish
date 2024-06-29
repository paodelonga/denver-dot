function fda --description "Fuzzy Listener"
    fd --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Listener' -0
end
