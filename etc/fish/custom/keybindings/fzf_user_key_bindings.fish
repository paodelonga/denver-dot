# TO BE DONE
#     ____      ____
#    / __/___  / __/
#   / /_/_  / / /_
#  / __/ / /_/ __/
# /_/   /___/_/ user-key-bindings.fish
#
# - $FZF_TMUX_OPTS
# - $FZF_CTRL_T_COMMAND
# - $FZF_CTRL_T_OPTS
# - $FZF_CTRL_R_OPTS
# - $FZF_ALT_R_COMMAND
# - $FZF_ALT__OPTS

status is-interactive; or exit 0


# Key bindings
# ------------
function fzf_user_key_bindings
#
#     function fzf-editor-widget --description "Fuzzy Editor"
#         set _FZF_OUTPUT (fd --type file --follow --hidden --no-ignore-vcs -E 'node_modules' -E '.git' | fzf --border-label 'Fuzzy Editor' -0)
#
#         if test -n "$_FZF_OUTPUT"
#             $EDITOR $_FZF_OUTPUT
#         end
#     end
#
#     function fzf-repos-widget -d 'Fuzzy Repository'
#         if not test -z "$REPOS_PATH"
#             if not test -d "$REPOS_PATH"
#                 mkdir "$REPOS_PATH"
#             end
#             fd . "$REPOS_PATH" --type directory --hidden --follow --prune --no-ignore-vcs -E 'node_modules' -E '.git' | grep -Po '[^/]+(?=/[^/]*$)' | eval (__fzfcmd) --read0 --print0 -q '(commandline)'  --border-label 'Fuzzy Repository Finder'  | tail -1 | read -lz _FZF_OUTPUT
#
#             if test -n "$_FZF_OUTPUT"
#                 if not test -d "$REPOS_PATH/$_FZF_OUTPUT"
#                     mkdir "$REPOS_PATH/$_FZF_OUTPUT"
#                     cd "$REPOS_PATH/$_FZF_OUTPUT"
#                     git init
#                 else
#                     commandline "$REPOS_PATH$_FZF_OUTPUT"
#                 end
#             end
#         end
#     end

#     function __fzfcmd
#         test -n "$FZF_TMUX"; or set FZF_TMUX 0
#         test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
#         if [ -n "$FZF_TMUX_OPTS" ]
#             echo "fzf-tmux $FZF_TMUX_OPTS -- "
#         else if [ $FZF_TMUX -eq 1 ]
#             echo "fzf-tmux -d$FZF_TMUX_HEIGHT -- "
#         else
#             echo "fzf"
#         end
#     end
#
#     bind \ct fzf-file-widget
#     bind \cr fzf-history-widget
#     bind \ec fzf-cd-widget
#     bind \er fzf-repos-widget
#     bind \ee fzf-editor-widget
#
#     if bind -M insert >/dev/null 2>&1
#         bind -M insert \ct fzf-file-widget
#         bind -M insert \cr fzf-history-widget
#         bind -M insert \ec fzf-cd-widget
#         bind -M insert \er fzf-repos-widget
#         bind -M insert \ee fzf-editor-widget
#     end
#
#     function __fzf_parse_commandline -d 'Parse the current command line token and return split of existing filepath, fzf query, and optional -option= prefix'
#         set -l commandline (commandline -t)
#
#         # strip -option= from token if present
#         set -l prefix (string match -r -- '^-[^\s=]+=' $commandline)
#         set commandline (string replace -- "$prefix" '' $commandline)
#
#         # eval is used to do shell expansion on paths
#         eval set commandline $commandline
#
#         if [ -z $commandline ]
#             # Default to current directory with no --query
#             set dir '.'
#             set fzf_query ''
#         else
#             set dir (__fzf_get_dir $commandline)
#
#             if [ "$dir" = "." -a (string sub -l 1 -- $commandline) != '.' ]
#                 # if $dir is "." but commandline is not a relative path, this means no file path found
#                 set fzf_query $commandline
#             else
#                 # Also remove trailing slash after dir, to "split" input properly
#                 set fzf_query (string replace -r "^$dir/?" -- '' "$commandline")
#             end
#         end
#
#         echo $dir
#         echo $fzf_query
#         echo $prefix
#     end
#
#     function __fzf_get_dir -d 'Find the longest existing filepath from input string'
#         set dir $argv
#
#         # Strip all trailing slashes. Ignore if $dir is root dir (/)
#         if [ (string length -- $dir) -gt 1 ]
#             set dir (string replace -r '/*$' -- '' $dir)
#         end
#
#         # Iteratively check if dir exists and strip tail end of path
#         while [ ! -d "$dir" ]
#             # If path is absolute, this can keep going until ends up at /
#             # If path is relative, this can keep going until entire input is consumed, dirname returns "."
#             set dir (dirname -- "$dir")
#         end
#
#         echo $dir
#     end
#
end
