local M = {}

-- helper functions ------------------------------------------------------------

local log = require('util.logger')

---@param message string
local function log_t(message)
  log.trace(message, 'plugins:snacks')
end

function M.setup()
  log_t('setup()')
  -- ---@type moepconf.plugin_name
  -- local plugin_name = 'snacks.nvim'
  -- if vim.list_contains(active_plugins, plugin_name) then
    require('snacks').setup({
      picker = { enabled = true },
    })
    -- TODO luaify
    vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
  -- end
end

return M
