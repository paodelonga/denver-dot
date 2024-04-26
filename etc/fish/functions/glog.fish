# A more beautiful and better detailed view of commit logs using pretty formats
function glog -d "Show a pretty formated git commit logs"
    if string match "*all*" "$argv[1]" -q
        git log --all --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" $argv[2..-1]
    else if string match "*graph*" "$argv[1]" -q
        git log --all --graph --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" $argv[2..-1]
    else
        git log --pretty=format:"%C(magenta)%h%Creset -%C(red)%d%Creset %s %C(dim green)(%cr) [%an]" --abbrev-commit -30 $argv[1..-1]
    end
end
