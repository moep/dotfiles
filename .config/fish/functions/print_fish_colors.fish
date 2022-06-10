function print_fish_colors --description 'Shows the various fish colors being used'
    set -l clr_list (set -n | grep fish | grep color | grep -v __)
    if test -n "$clr_list"
        set -l bclr (set_color normal)
        set -l bold (set_color --bold)
        for var in $clr_list
          set -l def $$var

          set_color normal
          printf "set -g "
          printf "%-35s" "$var"

          set_color $def
          printf "%s\r\n" "$def"

        end
    end
end
