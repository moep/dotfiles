
if not string length --quiet $TMUX; and string length --quiet $SSH_TTY; and status is-login
  echo "interactive"
  clear
  ufetch

  while true
    read -n1 -P "True Color Support [Y|n]" answer
    echo "answer: >>$answer<<"

    if string match --quiet --regex 'y|Y' $answer; or not string length --quiet $answer
      echo "Ja"
      set -x COLORTERM "truecolor"
      break
    end

    if not string match --quiet --regex 'y|Y|n|N' $answer; 
      continue
    end

    break
  end
  #echo "ssh without tmux"
  tmux new -A -s ssh

end
