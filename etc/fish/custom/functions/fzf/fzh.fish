function fzh --description "Fuzzy History Finder"
  set _FZF_OUTPUT (builtin history | fzf --no-sort --border-label 'Fuzzy History Finder' -0)

  if test -n "$_FZF_OUTPUT[1]"
    commandline $_FZF_OUTPUT
  end
end
