function __fzf_git_tags -d "Get git tags and send them to fzf"
  __is_git; or return

  set -l result (
    git tag --sort version:refname \
    | eval (__fzf_cmd) $FZF_DEFAULT_OPTS \
      --reverse \
      --no-multi \
      --info=hidden \
  )

  commandline -t $result
  commandline -f repaint
end
