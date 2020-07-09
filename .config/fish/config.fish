# Starts a graphical environment; hardcoded
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

# TODO probably does not work in TTYs
set -gx LS_COLORS (/usr/bin/ls_colors_generator)

# Supress echo on Control+Insert
# (Should be handled via .inputrc but it isn't)
bind \e\[2\;5~ cancel

# Autmatically added by shell script lib installer
set -gx BASH_SCRIPT_PATH /home/moep/.local/lib/shellscripts
