# I use this function as a shortcut to quickly visualize
# my local or global preferences for git repositories
function gls -d "Get local or global repository preferences"
    if string match "*global*" "$argv[1]" -q
        echo '[GLOBAL]'
        if not test -z "$argv[2]"
            git config --global --get-all "$argv[2]"
        else
            git config --global --list
        end
    else if string match "*local*" "$argv[1]" -q
        echo '[LOCAL]'
        if not test -z "$argv[2]"
            git config --local --get-all "$argv[2]"
        else
            git config --local --list
        end
    else
        echo '[GLOBAL]'
        git config --global --list
        echo
        echo '[LOCAL]'
        git config --local --list
    end
end
