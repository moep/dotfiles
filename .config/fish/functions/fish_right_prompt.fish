function __nnn_indicator
end

function fish_right_prompt
	#set -l last_status $status
	## Prompt status only if it's not 0
	#set -l stat
	#if test $last_status -ne 0
	#	set stat (set_color -b red black --bold)"[$last_status]"(set_color normal)
	#end

	#echo -n $stat

  if test -n "$NNNLVL" -a "$NNNLVL" -ge 1
    echo -n -s (set_color 444444) "[nnn]" (set_color normal)
    return
  end

end
