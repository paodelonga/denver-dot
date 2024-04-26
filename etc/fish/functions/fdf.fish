function fdf --description "fd file listener"
  fdfind --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1]
end
