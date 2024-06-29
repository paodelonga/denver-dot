function fuba --description "Fuzzy Finder Bat"
    set _FZF_OUTPUT (fd --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Finder Bat' -0)

    if test -n "$_FZF_OUTPUT"
        bat $_FZF_OUTPUT
    end
end
