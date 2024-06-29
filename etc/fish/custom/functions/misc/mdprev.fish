function mdprev --description 'Preview Markdown files in lynx using pandoc'
  pandoc -t html $argv[1..-1] | $BROWSER
end
