function venvact --description 'Activate python venv'
  if not test -z $VIRTUAL_ENV
    deactivate
  end
  source "$PWD/.venv/bin/activate.fish" || source "$argv[1]/.venv/bin/activate.fish"
end
