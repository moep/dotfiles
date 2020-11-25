function __fzf_git_status -d "Show git status with fzf"
  __is_git; or return
  
  # TODO This is a dirty hack and does not work with all status flags
  set -l preview_cmd "echo {} | sed 's/^...//' | xargs git diff HEAD | $FZF_GIT_PREVIEW_CMD"

  set -l result (
    git status --porcelain \
    | fzf $FZF_DEFAULT_OPTS --ansi --multi \
      --preview="$preview_cmd" \
    | sed 's/^...//g' | string join " "
  )

  commandline -t $result
  commandline -f repaint
end
