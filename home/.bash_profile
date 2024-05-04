# Start Xorg Server
if [ -z "${DISPLAY}" ] && [ "${XDG_VTNR}" -eq 1 ] && [ -z "$SSH_CONNECTION"] ; then
  exec startx -- -keeptty > ~/.xorg.log 2>&1
fi

# Cargo
. "$HOME/.cargo/env"

# Node Version Manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
