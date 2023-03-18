require("lualine").setup({
  options = {
    icons_enabled = false,
    theme = "auto",
    globalstatus = true,
    component_separators = { left = nil, right = nil },
    section_separators = { left = nil, right = nil },
  },
  
  sections = {
    lualine_a = {
      { "mode", 
        fmt = function(foo)
          return foo
        end,
      }
    },
    lualine_b = { "branch" }

  },
})
