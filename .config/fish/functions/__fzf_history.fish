function __fzf_history
  history merge
  set -l result (
    history -z | \
    eval (__fzf_cmd) \
       --read0 --tiebreak=index $FZF_DEFAULT_OPTS \
       -q "(commandline -j)"
  )

  commandline -- $result
  commandline -f repaint
end
