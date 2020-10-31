set -g  FZF_DEFAULT_OPTS --height 40% --layout=reverse 
set -ag FZF_DEFAULT_OPTS $FZF_DEFAULT_KEYBINDS

# TODO implement
#set -g FZF_CTRL_T_COMMAND "command find -L \$dir -type f 2> /dev/null | sed '1d; s#^\./##'"

