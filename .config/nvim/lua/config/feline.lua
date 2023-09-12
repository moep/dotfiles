-- see :h feline
local lsp = require("feline.providers.lsp");
local C = require("catppuccin.palettes").get_palette()

--local colors = require("colorscheme")
local components = {
  active = { {}, {}, {} },
  inactive = { {}, {} }
}

local is_editor_buffer = function()
  -- TODO implement
  return true
end

--local mode_colors = {
--  ['n'] = { 'NORMAL', colors.blue },
--  ['no'] = { 'N-PENDING', colors.blue },
--  ['i'] = { 'INSERT', colors.green },
--  ['ic'] = { 'INSERT', colors.green },
--  ['t'] = { 'TERMINAL', colors.green },
--  ['v'] = { 'VISUAL', colors.flamingo },
--  ['V'] = { 'V-LINE', colors.flamingo },
--  [''] = { 'V-BLOCK', colors.flamingo },
--  ['R'] = { 'REPLACE', colors.maroon },
--  ['Rv'] = { 'V-REPLACE', colors.maroon },
--  ['s'] = { 'SELECT', colors.maroon },
--  ['S'] = { 'S-LINE', colors.maroon },
--  [''] = { 'S-BLOCK', colors.maroon },
--  ['c'] = { 'COMMAND', colors.peach },
--  ['cv'] = { 'COMMAND', colors.peach },
--  ['ce'] = { 'COMMAND', colors.peach },
--  ['r'] = { 'PROMPT', colors.teal },
--  ['rm'] = { 'MORE', colors.teal },
--  ['r?'] = { 'CONFIRM', colors.mantle },
--  ['!'] = { 'SHELL', colors.green },
--}


local mode_colors = {
  ["n"] = { text = "N", fg = C.mantle, bg = C.blue },
  ["no"] = { text = "N-P", fg = C.mantle, bg = C.blue },
  ["i"] = { text = "I", fg = C.mantle, bg = C.green },
  ["ic"] = { text = "I", fg = C.mantle, bg = C.green },
  ["v"] = { text = "V", fg = C.mantle, bg = C.mauve },
  ["V"] = { text = "V-L", fg = C.mantle, bg = C.mauve },
  ["^V"] = { text = "V-B", fg = C.mantle, bg = C.mauve },
  ["R"] = { text = "R", fg = C.mantle, bg = C.red },
  ["Rv"] = { text = "V-R", fg = C.mantle, bg = C.red },
  ["s"] = { text = "S", fg = C.mantle, bg = C.lavender },
  ["S"] = { text = "S-L", fg = C.mantle, bg = C.lavender },
  ["c"] = { text = ":", fg = C.mantle, bg = C.subtext1 },
  ["cv"] = { text = ":", fg = C.mantle, bg = C.subtext1 },
  ["ce"] = { text = ":", fg = C.mantle, bg = C.subtext1 },
}

-- Helpers
local add_active_component = function(index, component)
  table.insert(components.active[index], component)
end

local add_inactive_component = function(index, component)
  table.insert(components.inactive[index], component)
end
-- /Helpers
local separator_component = {
  str = " ",
  hl = {
    fg = C.mantle,
    bg = C.mantle,
  },
}

-- Components
local mode_component = {
  provider = function()
    return " " .. mode_colors[vim.fn.mode()].text .. " "
  end,
  hl = function()
    return {
      fg = mode_colors[vim.fn.mode()].fg,
      bg = mode_colors[vim.fn.mode()].bg,
      style = "bold",
    }
  end,
  enabled = is_editor_buffer()
}

local file_name_component = {
  provider = function()
    local path = vim.fn.expand("%:p:.")
    return path
  end,
  hl = {
    fg = C.text,
    bg = C.mantle,
  },
  left_sep = separator_component,
}

local curpos_component = {
  provider = "position",
}

local line_percentage_component = {
  provider = function()
    return "%%"
  end,
  left_sep = separator_component,
}
-- /Components


-- active components
add_active_component(1, mode_component)
add_active_component(1, file_name_component)

add_active_component(3, curpos_component)
add_active_component(3, line_percentage_component)

-- inactive component
add_inactive_component(1, file_name_component)


require("feline").setup({ components = components })
