function ffzr --description 'Fuzzy Repository Finder'
    if not test -z "$REPOS_PATH"
        if not test -d "$REPOS_PATH"
            mkdir "$REPOS_PATH"
        end
        if count $argv > /dev/null
            if not test -d "$REPOS_PATH/$argv[1]"
                mkdir "$REPOS_PATH/$argv[1]"
                cd "$REPOS_PATH/$argv[1]"
                git init
            else
                cd "$REPOS_PATH/$argv[1]"
            end
        else
            cd "$REPOS_PATH"
        end
    end
end
