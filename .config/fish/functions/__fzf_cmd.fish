function __fzf_cmd
  set -q FZF_TMUX; or set FZF_TMUX 0

  if [ $FZF_TMUX -eq 0 ]
    echo "fzf"
  else
    echo "fzf-tmux"
  end
end
