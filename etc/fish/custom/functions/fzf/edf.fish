function edf --description "Fuzzy Editor"
    set _FZF_OUTPUT (fd --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Editor' -0)

    if test -n "$_FZF_OUTPUT"
        $EDITOR $_FZF_OUTPUT
    end
end
