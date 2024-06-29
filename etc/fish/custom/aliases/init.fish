# keybindings module loader

set -x __FUNCNAME "__cff_$(basename (dirname (status -f)))_initializer__"

# well...
function $__FUNCNAME
    # set modules names here
    set -a MODULE_LIST "git"
    set -a MODULE_LIST "general"

    set module_path (dirname (status -f))
    set module_name (basename $module_path)

    # iterate modules in MODULE_LIST
    for _module_idx in $MODULE_LIST
        if test -r "$module_path/$_module_idx.fish"
            source "$module_path/$_module_idx.fish"

            set --global --append "__cff_module_$module_name""_loaded_list" $_module_idx
        else
            echo echo "cannot load module $_module_idx, init.fish not found"
        end
    end
end

$__FUNCNAME
