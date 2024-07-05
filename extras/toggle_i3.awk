BEGIN {
  if (MODE != "dark" && MODE != "bright") {
    exit 1
  }

  if (MODE == "dark") {
    fg_color = "#fbc334"
    bg_color = "#222222"
  } else {
    fg_color = "#000000"
    bg_color = "#cccccc"
  }

}

/^set \$[b|f]g_color/ {
  color_var=$2
  color_val=""
  
  if (color_var == "\$bg_color") {
    color_val = fg_color
  } else if (color_var == "\$bg_color_inactive") {
    color_val = bg_color
  } else if (color_var == "\$fg_color") {
    color_val = bg_color
  } else if (color_var == "\$fg_color_inactive") {
    color_val = bg_color
  }

  printf("set %-19s %s\n", color_var, color_val) 
  
  next
}

// {
  print $0
}
