# Git settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_hide_untrackedfiles 1

set -g __fish_git_prompt_color_branch black -b brwhite 
# git svn verbose name informative none
set -g __fish_git_prompt_showupstream "none"
set -g __fish_git_prompt_char_upstream_ahead "↑"
set -g __fish_git_prompt_char_upstream_behind "↓"
set -g __fish_git_prompt_char_upstream_prefix ""

set -g __fish_git_prompt_color_dirtystate black -b cyan
set -g __fish_git_prompt_color_stagedstate black -b yellow
set -g __fish_git_prompt_color_invalidstate black -b red
set -g __fish_git_prompt_color_untrackedfiles black -b cyan 
set -g __fish_git_prompt_color_cleanstate black -b green 

set -g __fish_git_prompt_char_dirtystate "*"
set -g __fish_git_prompt_char_invalidstate "#" 
set -g __fish_git_prompt_char_stagedstate "+"

set -g ___fish_git_prompt_color_prefix (set_color brblack -b brwhite) 
set -g ___fish_git_prompt_color_suffix (set_color normal) 

set -g __fish_git_prompt_char_stateseparator ''


function fish_prompt
  set -l last_status $pipestatus[1]
  set -l stat
  if test $last_status -ne 0;
    set stat (set_color -b fa286a black --bold)"[$last_status]"(set_color normal)" "
  end

  if __is_git
    echo -n -s $stat (set_color black -b 9d00ff) " " (prompt_pwd) " " (fish_git_prompt "%s ")
  else
    echo -n -s $stat (set_color black -b 9d00ff) " " (prompt_pwd) " " (set_color normal) " " 
  end

  set_color normal
end

#function fish_right_prompt
#  echo -n -s (fish_git_prompt " %s")
#end

