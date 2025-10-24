set -l default '38;2;255;255;255'

set -l null '38;2;100;100;100'
set -l false '38;2;255;0;0'
set -l true '38;2;0;255;0'
set -l numbers '38;2;15;215;255'
set -l strings '38;2;255;0;230'
set -l arrays "1;$default"
set -l objects "1;$default"
set -l object_keys "1;$default"

set -e JQ_COLORS

function add_color
  if set -q JQ_COLORS
    set -gx JQ_COLORS "$JQ_COLORS:argv[1]"
  else
    set -gx JQ_COLORS "$argv[1]"
  end
end

# Order: null, false, true, numbers, strings, arrays, objects, object keys
add_color $null
add_color $false
add_color $true
add_color $numbers
add_color $strings
add_color $arrays
add_color $objects
add_color $object_keys
