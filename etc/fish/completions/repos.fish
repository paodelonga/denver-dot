set -l REPOS (ls -a "$REPOS_PATH" | sort)
complete -f -c repos -n "not __fish_seen_subcommand_from $REPOS" -a "$REPOS"
