function greeting -d "What's up, fish?"
  fetch

  # A warning that you are logged in in private mode
  if not test -z $fish_private_mode
      # echo -e " \033[1;36mBy default this \033[1;33mshell\033[1;36m is in \033[1;31mprivate mode\033[1;36m.\033[0;0m\n"
      echo -e " \033[1;36mThis shell is in \e[4m\033[1;31m\e]8;;https://fishshell.com/docs/current/interactive.html#private-mode\aprivate mode\e]8;;\a\033[1;36m\e[0m.\033[0;0m\n"
  end
end
