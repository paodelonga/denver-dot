function fdf --description "Fuzzy Finder"
  fd --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Finder' -0
end
