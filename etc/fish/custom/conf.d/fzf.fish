# Default command indexing files and directories with some exclusions
export FZF_DEFAULT_COMMAND="fd --type file --type directory --hidden --follow --no-ignore-vcs -E 'node_modules' -E '.git'"

export FZF_ALT_C_COMMAND="fd --type directory --hidden --follow --no-ignore-vcs -E 'node_modules' -E '.git'"
export FZF_CTRL_T_COMMAND="fd --hidden --follow --no-ignore-vcs -E 'node_modules' -E '.git'"

# Colorscheme
export FZF_DEFAULT_OPTS="
--color=fg:#d8d8d8,bg:#121212,hl:#707880
--color=fg+:#d8d8d8,bg+:#2d2d2d,hl+:#f92672
--color=info:#89b4fa,prompt:#4d4d4d,pointer:#89b4fa
--color=marker:#f92672,spinner:#e6db74,header:#707880"

# Preferences
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--layout=default
--margin=1
--padding=1
--border=rounded
--info=inline
--prompt=~
--multi"

# Preview
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--preview '
  if file --mime-type {} | grep -qF directory; then
    eza --group-directories-first -aw1 {}
  else
    bat --color=always {}
  fi'
--preview-window hidden"

# Fzf bindings - preferences
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS
--bind '?:toggle-preview'"

# Shell bindings - preferences
export FZF_CTRL_T_OPTS="
--border-label 'Fuzzy Selector'
--no-height"

export FZF_CTRL_R_OPTS="
--border-label 'Fuzzy History Selector'
--no-height
--preview 'echo {}'
--preview-window down:90%:wrap"
export FZF_ALT_C_OPTS="
--border-label 'Change directory'
--no-height"

# Completion trigger for fzf tab completion
export FZF_COMPLETION_TRIGGER='``'
