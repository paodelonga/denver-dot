function fzr --description 'Fuzzy Repository Finder'
    if not test -z "$REPOS_PATH"
        if not test -d "$REPOS_PATH"
            mkdir "$REPOS_PATH"
        end
        set _FZF_OUTPUT (fd . "$REPOS_PATH" --type directory --hidden --follow --prune --no-ignore-vcs -E 'node_modules' -E '.git' | grep -Po '[^/]+(?=/[^/]*$)' | fzf -q "$argv[1..-1]" --print-query --border-label 'Fuzzy Repository Finder' | tail -1)
        if test -n "$_FZF_OUTPUT"
            if not test -d "$REPOS_PATH/$_FZF_OUTPUT"
                mkdir "$REPOS_PATH/$_FZF_OUTPUT"
                cd "$REPOS_PATH/$_FZF_OUTPUT"
                git init
            else
                cd "$REPOS_PATH$_FZF_OUTPUT"
            end
        end
    end
end
