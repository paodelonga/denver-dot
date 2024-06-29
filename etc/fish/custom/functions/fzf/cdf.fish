function cdf --description "Fuzzy Directory Changer"
    set _FZF_OUTPUT (fd --type directory --hidden --follow --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Directory Changer' -0)

    if test -n "$_FZF_OUTPUT[1]"
        cd $_FZF_OUTPUT
    end
end
