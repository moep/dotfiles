# Valid for all fzf invocations
set -g FZF_DEFAULT_KEYBINDS \
  --bind 'ctrl-d:page-down' \
  --bind 'ctrl-u:page-up' \
  --bind 'alt-j:preview-down' \
  --bind 'alt-k:preview-up'

# Valid for certain invocations only
# Seperated so they can used for header texts
set -g FZF_KEYBIND_TOGGLE_PREVIEW "alt-space"

# Command line invocations 
bind \cr '__fzf_history'
bind \cgl '__fzf_git_log'
bind \cgt '__fzf_git_tags'
bind \cgs '__fzf_git_status'

