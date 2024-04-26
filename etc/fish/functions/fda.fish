function fda --description "Fuzzy lister"
    fdfind --type file --type directory --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1]
end
