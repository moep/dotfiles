# Git settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch white --bold
set -g __fish_git_prompt_showupstream "informative"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_color_dirtystate blue
set -g __fish_git_prompt_color_stagedstate yellow
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_untrackedfiles $fish_color_normal
set -g __fish_git_prompt_color_cleanstate green --bold

set -g __fish_git_prompt_char_dirtystate "*"
set -g __fish_git_prompt_char_invalidstate "#" 
set -g __fish_git_prompt_char_stagedstate "+"

function fish_prompt
 echo -n -s (set_color brblue) (prompt_pwd) (set_color brmagenta) " $symbol_prompt "
 set_color normal
end

function fish_right_prompt
  fish_git_prompt
end

