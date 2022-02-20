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
set -a fish_user_paths ~/.local/bin

# TODO Add check if term has capability (maybe only allow from X terminals?)
#set -gx LS_COLORS (/usr/bin/ls_colors_generator)
set -gx LS_COLORS (cat {$__fish_config_dir}/data/lscolors)

# Supress echo on Control+Insert
# (Should be handled via .inputrc but it isn't)
bind \e\[2\;5~ cancel

# Don't show "Welcome to fish ..."
set fish_greeting

# Color scheme
# AF87D7 - highlight
# fb2f2f - rot
# set -U fish_color_normal normal
# set -U fish_color_command ffffff
# set -U fish_color_quote a8a8a8
# set -U fish_color_redirection 808080
# set -U fish_color_end 949494
# set -U fish_color_error fb2f2f
# set -U fish_color_param d7d7d7
# set -U fish_color_comment bcbcbc
# set -U fish_color_match --background=brblue
# set -U fish_color_selection white --bold --background=brblack
# set -U fish_color_search_match bryellow --background=brblack
# set -U fish_color_history_current --bold
# set -U fish_color_operator 00a6b2
# set -U fish_color_escape 00a6b2
# set -U fish_color_cwd green
# set -U fish_color_cwd_root red
# set -U fish_color_valid_path --underline
# set -U fish_color_autosuggestion 777777
# set -U fish_color_user brgreen
# set -U fish_color_host normal
# set -U fish_color_cancel -r
# set -U fish_pager_color_completion normal
# set -U fish_pager_color_description B3A06D yellow
# set -U fish_pager_color_prefix white --bold --underline
# set -U fish_pager_color_progress brwhite --background=cyan
