# enviroment variables
set -x REPOS_PATH "/home/paodelonga/repositories/"
set -x BROWSER firefox
set -x EDITOR micro
set -x IDE nvim
set -x PAGER cat

# configure pinentry to current tty
set -xg GPG_TTY (tty)
