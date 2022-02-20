# Git settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch black -b brwhite 
# git svn verbose name informative none
set -g __fish_git_prompt_showupstream "none"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_color_dirtystate brblack -b cyan
set -g __fish_git_prompt_color_stagedstate brblack -b yellow
set -g __fish_git_prompt_color_invalidstate brblack -b red
set -g __fish_git_prompt_color_untrackedfiles brblack -b cyan 
set -g __fish_git_prompt_color_cleanstate brblack -b green 

set -g __fish_git_prompt_char_dirtystate "*"
set -g __fish_git_prompt_char_invalidstate "#" 
set -g __fish_git_prompt_char_stagedstate "+"

set -g ___fish_git_prompt_color_prefix (set_color brblack -b brwhite) 
set -g ___fish_git_prompt_color_suffix (set_color normal) 

set -g __fish_git_prompt_char_stateseparator ''

function fish_prompt
  if __is_git
    echo -n -s (set_color black -b fbc334) (prompt_pwd) " " (fish_git_prompt "%s ")
  else
    echo -n -s (set_color black -b fbc334) (prompt_pwd) " " (set_color normal) " " 
  end

  set_color normal
end

#function fish_right_prompt
#fish_git_prompt
#end

