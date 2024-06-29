function ffzf --description "Fuzzy Finder"
    set _FZF_OUTPUT (fd --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' $argv[1..-1] | fzf --border-label 'Fuzzy Finder' -0)

    if test -n "$_FZF_OUTPUT[1]"
        commandline $_FZF_OUTPUT
    end
end
