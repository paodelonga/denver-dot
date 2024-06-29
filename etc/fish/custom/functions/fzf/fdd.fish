function fdd --description "Fuzzy Directory Listener"
  fd --type directory --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Directory Listener' -0
end
