# Starts a graphical environment; hardcoded
# Currently done via bash;
#if test "$DISPLAY" = "" -a (tty) = /dev/tty1
#  echo "Starting X"
#  startx 
#end



# Default editor
set -gx EDITOR vim

set -a fish_user_paths ~/.local/bin

# TODO Add check if term has capability (maybe only allow from X terminals?)
#set -gx LS_COLORS (/usr/bin/ls_colors_generator)
set -gx LS_COLORS (cat {$__fish_config_dir}/data/lscolors)

# Manpage colors
# blink
set -gx LESS_TERMCAP_mb '[1;33m'
# bold
set -gx LESS_TERMCAP_md '[38;5;15m'
set -gx LESS_TERMCAP_me '[38;5;254m'
# standout
set -gx LESS_TERMCAP_so '[01;33m'
set -gx LESS_TERMCAP_se '[38;5;254m'
# underline
set -gx LESS_TERMCAP_us '[1;4;38;5;15m'
set -gx LESS_TERMCAP_ue '[0;38;5;254m'

# Supress echo on Control+Insert
# (Should be handled via .inputrc but it isn't)
bind \e\[2\;5~ cancel

# Don't show "Welcome to fish ..."
set fish_greeting

# Glyphs
set -g symbol_prompt ">>"
set -g symbol_creeper ""
set -g symbol_upstream "⇡"
set -g symbol_downstream "⇣"

# Theme settings
set -gx GTK_THEME_DARK "WhiteSur-dark"
set -gx GTK_THEME_BRIGHT "WhiteSur-light"

set -gx ALACRITTY_THEME_DARK "moep_dark"
set -gx ALACRITTY_THEME_BRIGHT "moep_bright"
