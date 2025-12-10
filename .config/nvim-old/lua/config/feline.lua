-- see :h feline
local lsp = require("feline.providers.lsp");
local C = require("catppuccin.palettes").get_palette()

local is_editor_buffer = function()
  -- TODO implement
  return true
end

-- TOOD remaining modes
local mode_colors = {
  ["n"] = { text = "N", fg = C.mantle, bg = C.subtext1 },
  ["no"] = { text = "N-P", fg = C.mantle, bg = C.subtext1 },
  ["i"] = { text = "I", fg = C.mantle, bg = C.green },
  ["ic"] = { text = "I", fg = C.mantle, bg = C.green },
  ["v"] = { text = "V", fg = C.mantle, bg = C.mauve },
  ["V"] = { text = "V-L", fg = C.mantle, bg = C.mauve },
  [""] = { text = "^V", fg = C.mantle, bg = C.mauve },
  ["R"] = { text = "R", fg = C.mantle, bg = C.red },
  ["Rv"] = { text = "V-R", fg = C.mantle, bg = C.red },
  ["s"] = { text = "S", fg = C.mantle, bg = C.lavender },
  ["S"] = { text = "S-L", fg = C.mantle, bg = C.lavender },
  ["c"] = { text = ":", fg = C.mantle, bg = C.blue },
  ["cv"] = { text = ":", fg = C.mantle, bg = C.blue },
  ["ce"] = { text = ":", fg = C.mantle, bg = C.blue },
  ["r"] = { text = "?", fg = C.mantle, bg = C.blue },
  ["rm"] = { text = "M", fg = C.mantle, bg = C.blue },
  ["r?"] = { text = "?", fg = C.mantle, bg = C.blue },
  ["!"] = { text = ">", fg = C.mantle, bg = C.blue },
}

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

local lsp_client_names_component = {
  provider = "lsp_client_names",
  hl = {
    fg = C.text,
    bg = C.mantle,
  },
}

-- TODO refactor? (new function to create error components)
local diagnostics_components = {
  errors = {
    provider = function()
      local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
      return " " .. num_errors .. " "
    end,
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR)
    end,
    hl = {
      fg = C.mantle,
      bg = C.red,
    },
  },
  warnings = {
    provider = function()
      local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
      return " " .. num_errors .. " "
    end,
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.WARN)
    end,
    hl = {
      fg = C.mantle,
      bg = C.yellow,
    },
  },
  hints = {
    provider = function()
      local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
      return " " .. num_errors .. " "
    end,
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.HINT)
    end,
    hl = {
      fg = C.mantle,
      bg = C.teal,
    },
  },
  infos = {
    provider = function()
      local num_errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
      return " " .. num_errors .. " "
    end,
    enabled = function()
      return lsp.diagnostics_exist(vim.diagnostic.severity.INFO)
    end,
    hl = {
      fg = C.mantle,
      bg = C.text,
    },
  }
}

local curpos_component = {
  provider = "position",
  hl = {
    fg = C.text,
    bg = C.mantle,
  },
  left_sep = separator_component,
}

local line_percentage_component = {
  provider = "line_percentage",
  hl = {
    fg = C.text,
    bg = C.mantle,
  },
  left_sep = separator_component,
}
-- /Components

local properties = {
  force_inactive = {
    filetypes = {
      "NvimTree",
      "packer",
    }
  }
}

local components = {
  active = {
    {
      mode_component,
      file_name_component,
    },
    {
      diagnostics_components.errors,
      diagnostics_components.warnings,
      diagnostics_components.hints,
      diagnostics_components.infos,
      separator_component,
    },
    {
      lsp_client_names_component,
      curpos_component,
      line_percentage_component,
    }
  },
  inactive = {
    {
      file_name_component,
    },
    {}
  }
}

require("feline").setup({
  components = components,
  properties = properties,
})
