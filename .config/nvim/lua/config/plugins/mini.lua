local M = {}
local function get_mode()
  -- TODO set mode according to PWD if NVIM_MODE is not set
  if vim.env.NVIM_MODE == nil or vim.env.NVIM_MODE == '' then
    return 'default'
  else
    return vim.env.NVIM_MODE
  end
end

function M.setup() 
  if get_mode() ~= 'minimal' then
    require('mini.completion').setup({})
    -- require('mini.pairs').setup({})
    require('mini.pick').setup({})
    -- require('mini.surround').setup({})
  end
end

return M
