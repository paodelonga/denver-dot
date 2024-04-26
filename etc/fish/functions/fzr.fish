function fzr -d 'Fuzzy Repository'
    if not test -z "$REPOS_PATH"
        if not test -d "$REPOS_PATH"
            mkdir "$REPOS_PATH"
        end
        set _FZF_OUTPUT (fdfind . "$REPOS_PATH" --type directory --hidden --follow --prune --no-ignore-vcs -E 'node_modules' -E '.git' | sed 's/.*\///' | fzf -q "$argv[1..-1]" --print-query --border-label 'Fuzzy Repository' -0 | tail -1)
        if test -n "$_FZF_OUTPUT"
            if not test -d "$REPOS_PATH/$_FZF_OUTPUT"
                mkdir "$REPOS_PATH/$_FZF_OUTPUT"
                cd "$REPOS_PATH/$_FZF_OUTPUT"
                git init
            else
                cd "$REPOS_PATH/$_FZF_OUTPUT"
            end
        end
    end
end
