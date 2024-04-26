function dsf --description 'Diff So Fancy'
    diff -u $argv[1..-1] | diff-so-fancy
end
