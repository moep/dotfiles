# Use 'set --show' for debugging

# Default keybindings

set -g FZF_DEFAULT_KEYBINDS \
  --bind 'ctrl-d:page-up' \
  --bind 'ctrl-u:page-up' \
  --bind 'alt-j:preview-down' \
  --bind 'alt-k:preview-up'

set -g FZF_KEYBIND_TOGGLE_PREVIEW 'alt-space'

# Use-case specific keybinds
bind \cr '__fzf_history'

bind \cgl '__fzf_git_log'
bind \cg\cl '__fzf_git_log'

bind \cgs '__fzf_git_status'
bind \cg\cs '__fzf_git_status'

# Options
set -e FZF_DEFAULT_OPTS
set -g FZF_DEFAULT_OPTS --height 100% --layout reverse
set -ag FZF_DEFAULT_OPTS --pointer='?' --marker='!'
set -ag FZF_DEFAULT_OPTS $FZF_DEFAULT_KEYBINDS
set -ag FZF_DEFAULT_OPTS --info inline-right
# TODO make dynamic for non UTF-8 capable terminals
set -ag FZF_DEFAULT_OPTS --scrollbar='┃'

function addColor
  set -l name "$argv[1]"
  set -l value "$argv[2]"

  set -ag FZF_DEFAULT_OPTS "--color=$name:$value"
end

set -l fg '#ffffff'
set -l bg black
set -l dim '#8f8f8f'
set -l hl '#ffdc74'
set -l special '#e861d2'
set -l marker '#0fd7ff'

addColor fg $g
addColor bg $bg
addColor current-fg $fg
addColor current-bg $bg
addColor gutter $bg
addColor hl "$hl:reverse"
addColor current-hl "$hl:underline"
addColor query $fg
addColor disabled $dim
addColor info $dim
addColor border $dim
addColor label $fg
addColor info $hl
addColor prompt $hl
addColor pointer "$special:bold"
addColor marker "$marker:bold"
addColor spinner $special
addColor header $fg

# Git integration
set -U FZF_GIT_LOG_FORMAT "%h%C(auto)%d%C(reset( %s %an %cr|"
set -U FZF_GIT_PREVIEW_CMD "delta"


