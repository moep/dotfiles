# Starts a graphical environment; hardcoded
# Currently done via bash;
if test "$DISPLAY" = "" -a (tty) = /dev/tty1
  echo "Starting X"
  #startx 
end

# Glyphs
#set -g symbol_prompt "❯"
set -g symbol_prompt ">>"
set -g symbol_creeper ""
set -g symbol_upstream "⇡"
set -g symbol_downstream "⇣"

# Use nvim
set -gx EDITOR nvim

# Make executable Python modules in user space visible
set -Ua fish_user_paths ~/.local/bin

# TODO Add check if term has capability (maybe only allow from X terminals?)
#set -gx LS_COLORS (/usr/bin/ls_colors_generator)
set -gx LS_COLORS (cat {$__fish_config_dir}/data/lscolors)

# Supress echo on Control+Insert
# (Should be handled via .inputrc but it isn't)
bind \e\[2\;5~ cancel

# Don't show "Welcome to fish ..."
set fish_greeting

