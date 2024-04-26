function fuba --description "Fuzzy Batcat"
    set _FZF_OUTPUT (fdfind --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Batcat' -0)

    if test -n "$_FZF_OUTPUT"
        bat $_FZF_OUTPUT
    end
end
