# enviroment variables
set -xg REPOS_PATH "/home/paodelonga/repositories/"
set -xg BROWSER firefox
set -xg EDITOR micro
set -xg IDE nvim
set -xg PAGER cat

# configure pinentry to current tty
set -xg GPG_TTY (tty)
