-- helper functions ------------------------------------------------------------ 

---@param message string The message to log
local function log_d(message)
  vim.api.nvim_echo({{'[notes] ', '@comment'}, {message, '@comment'}}, true, {})
end

-- custom notes config ---------------------------------------------------------

vim.keymap.set('n', '<leader>mm', function()
  require('render-markdown').buf_toggle()
end, { desc = 'toggle markdown rendering' })

