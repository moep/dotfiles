-- helper functions ------------------------------------------------------------ 

---@param message string The message to log
local function log_d(message)
  vim.notify('[notes] ' .. message, vim.log.levels.DEBUG)
end

-- custom notes config ---------------------------------------------------------

vim.keymap.set('n', '<leader>mm', function()
  require('render-markdown').buf_toggle()
end, { desc = 'toggle markdown rendering' })

