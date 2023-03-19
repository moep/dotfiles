function trim(str) {
  ret = str
  sub("^ \+", "", ret)
  gsub("\t", "", ret)
  return ret
}

function starts_with(str, prefix) {
  pos = index(str, prefix)
  return pos == 1
}

function substr_from_tokens(min_idx, tokens) {
  ret = ""
  for (idx in tokens) {
    if (idx < min_idx) {
      continue
    }
    ret = ret " " tokens[idx]
  }
  return ret
}

function array_push(array, value) {
  array[length(array) + 1] = value
}

BEGIN {
  

}

/^(n |i |o |x )/ {
  last_line = $0
  next
}

! /^(n |i |o |x )/ {
  if(ignore_next) {
    next
  }

  line = trim($0)
  
  if(starts_with(line, "\[user\] ")) {
    split(last_line, tokens) 
    gsub("\\[user\\] ", "", line)
    last_line2 = substr_from_tokens(4, tokens)
    #output = sprintf("%-20s %s\r\n%26s", tokens[2], last_line2, line) 
    output = sprintf("%-20s %s", tokens[2], line) 
    # TODO Why does %25s not work?
    #output = output "\r\n" sprintf("                      %s", line)
    array_push(OUT_INSERT, output)
  }

}

END {
  for (idx in OUT_INSERT) {
    print OUT_INSERT[idx]
  }
}
