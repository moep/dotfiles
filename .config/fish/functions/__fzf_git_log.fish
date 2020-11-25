function __fzf_git_log -d "Call git log with fzf"
  __is_git; or return

  set -l extract_hash "echo {} | grep -o '[a-f0-9]\{7\}' | head -n1"
  set -l preview_cmd "$extract_hash | xargs git show --color=always | $FZF_GIT_PREVIEW_CMD" 
  
  set -l result (
    git log --pretty="format:$FZF_GIT_LOG_FORMAT" --color=always --graph \
    | fzf $FZF_DEFAULT_OPTS --ansi --no-sort --reverse --no-multi \
        --height 100% \
        --preview="$preview_cmd"  \
        --header="$FZF_KEYBIND_TOGGLE_PREVIEW: toggle preview" \
        --bind "$FZF_KEYBIND_TOGGLE_PREVIEW:toggle-preview"  \
    | grep -o '[a-g0-9]\{7\}' | head -n1
  )

  commandline -t $result
  commandline -f repaint

end
