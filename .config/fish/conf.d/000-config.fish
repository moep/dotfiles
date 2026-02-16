# Starts a graphical environment; hardcoded
# Currently done via bash;
#if test "$DISPLAY" = "" -a (tty) = /dev/tty1
#  echo "Starting X"
#  startx 
#end



# Default editor
# TODO create lightweight nvim config so that vim can be replaced?
set -gx EDITOR vim

fish_add_path ~/.local/bin

# TODO Add check if term has capability (maybe only allow from X terminals?)
#set -gx LS_COLORS (/usr/bin/ls_colors_generator)
set -gx LS_COLORS (cat {$__fish_config_dir}/data/lscolors)

# Manpage colors
# blink
set -gx LESS_TERMCAP_mb \e'[1;33m'
# bold
set -gx LESS_TERMCAP_md \e'[1;38;5;81m'
set -gx LESS_TERMCAP_me \e'[38;5;254m'
# standout
set -gx LESS_TERMCAP_so \e'[1;38;5;230m'
set -gx LESS_TERMCAP_se \e'[38;5;254m'
# underline
set -gx LESS_TERMCAP_us \e'[1;4;38;5;230m'
set -gx LESS_TERMCAP_ue \e'[0;38;5;254m'

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

# Allow truecolors for vim
# TODO check if running in graphical mode
set -gx COLORTERM truecolor

# Color scheme
# TODO Convert to universal variables to support theme changing
# 1. fish_config colors
# 2. edit and save theme
# 3. fish_confg theme dump
# 4. sed -i '/^SETUVAR fish_color/d' ~/.config/fish/fish_variables
# see function print_fish_colors

set -l dim 666666
set -l red fb2f2f
set -l special ff00e6
set -l string 3b83ff

set -g fish_color_autosuggestion $dim
set -g fish_color_cancel $special
set -g fish_color_command nomarl
set -g fish_color_comment $dim
set -g fish_color_end normal --bold
set -g fish_color_error $red
set -g fish_color_escape $special
set -g fish_color_history_current normal
set -g fish_color_keyword normal --bold
set -g fish_color_match normal
set -g fish_color_normal normal
set -g fish_color_operator $string
set -g fish_color_option normal
set -g fish_color_param normal
set -g fish_color_quote $string
set -g fish_color_redirection $special
set -g fish_color_search_match normal
set -g fish_color_selection normal --bold
set -g fish_color_valid_path normal --underline

set -g fish_pager_color_background --background=normal
set -g fish_pager_color_completion normal
set -g fish_pager_color_description $dim
set -g fish_pager_color_prefix $special
set -g fish_pager_color_progress $special
set -g fish_pager_color_secondary_background $fish_pager_color_background
set -g fish_pager_color_secondary_completion $fish_pager_color_completion
set -g fish_pager_color_secondary_description $fish_pager_color_description
set -g fish_pager_color_secondary_prefix $fish_pager_color_prefix
set -g fish_pager_color_selected_background --background=ffffff
set -g fish_pager_color_selected_completion 000000
set -g fish_pager_color_selected_description 000000
set -g fish_pager_color_selected_prefix 000000

# User specific colors
set -gx USER_COLOR_PRIMARY "cccccc"
set -gx USER_COLOR_PRIMARY_DARK "aaaaaa"
set -gx USER_COLOR_PRIMARY_DARKER "555555"
