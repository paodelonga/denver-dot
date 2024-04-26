function venvinit --description 'Init and activate Python venv'
  if not test -z $VIRTUAL_ENV
    deactivate
  end

  python -m venv .venv
  source "$PWD/.venv/bin/activate.fish"
end
