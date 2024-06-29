# well...
function __cff_initializer__
    set --export CFF_PATH (dirname (status -f))

    # load cff profile
    test -r "$CFF_PATH/profile.fish" &&
    source "$CFF_PATH/profile.fish" ||
    echo "cannot source $CFF_PATH/profile.fish"

    function import_module
        for _module_idx in $argv[1..-1]
            if test -r "$CFF_PATH/$_module_idx"
                if test -d "$CFF_PATH/$_module_idx"
                    if test -r "$CFF_PATH/$_module_idx/init.fish"
                        source "$CFF_PATH/$_module_idx/init.fish"
                        set --global --append "__cff_loaded_module_list" $_module_idx
                    else
                        echo "cannot load module $_module_idx init.fish not found"
                    end
                end
            else
                echo "cannot load module $_module_idx PATH $CFF_PATH/$_module_idx not readable"
            end
        end
    end

    import_module "aliases" "completions" "keybindings"

    # gambi
    for _PATH in $CFF_PATH/"functions" $CFF_PATH/"conf.d"
        for _FILE in (tree "$_PATH" -afinF --noreport | grep -v '/$')
            source "$_FILE"
        end
    end
end

__cff_initializer__
