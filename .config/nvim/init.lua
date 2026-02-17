--
--                                                       __                
--   ___ ___     ___      __   _____       ___   __  __ /\_\    ___ ___    
-- /' __` __`\  / __`\  /'__`\/\ '__`\   /' _ `\/\ \/\ \\/\ \ /' __` __`\  
-- /\ \/\ \/\ \/\ \L\ \/\  __/\ \ \L\ \__/\ \/\ \ \ \_/ |\ \ \/\ \/\ \/\ \ 
-- \ \_\ \_\ \_\ \____/\ \____\\ \ ,__/\_\ \_\ \_\ \___/  \ \_\ \_\ \_\ \_\
--  \/_/\/_/\/_/\/___/  \/____/ \ \ \/\/_/\/_/\/_/\/__/    \/_/\/_/\/_/\/_/
--                               \ \_\                                     
--                                \/_/
--
--vim.loader.enable()

-- type definitions ------------------------------------------------------------

---@alias moepconf.mode 'default' | 'notes'

-- helper functions ------------------------------------------------------------ 

---Debug log
---@param message string The message to log
local function log_d(message)
  -- vim.notify('[init] ' .. message, vim.log.levels.DEBUG)
  vim.api.nvim_echo({{'[init] ', '@comment'}, {message, '@comment'}}, true, {})
end

-- custom modes ----------------------------------------------------------------

--- @type moepconf.mode
vim.g.nvim_mode = vim.env.NVIM_MODE or 'default'
log_d('nvim mode: ' .. vim.g.nvim_mode)

-- better message handling -----------------------------------------------------

-- EXPERIMENTAL!
-- Removes 'Press ENTER or type command to continue'
-- Use g< or :mess to show messages
require('vim._core.ui2').enable({
  enable = true,
  msg = {
    ---@type 'cmd'|'msg'
    target = 'cmd',
    timeout = 3000, -- Time a message is visible in the message window.
  },
})

-- 3rd party plugins -----------------------------------------------------------

require('config.plugins')

-- user config ----------------------------------------------------------------- 

require('config.common')
require('config.lsp')
require('config.keybinds')
require('config.treesitter')

if vim.g.nvim_mode == 'notes' then
  require('config.notes')
end

-- diy statusline
require('statusline')

-- plugin under local development
-- vim.opt.runtimepath:prepend('/home/moep/code/nvim/nbish.nvim/')
-- require('nbish.types')
--
-- ---@type nbishConfig
-- vim.g.nbish_config = {
--   nb_root = '~/.local/share/nb2'
-- }
-- require('nbish')


-- other plugins ---------------------------------------------------------------

require('mini.completion').setup({})

-- playground ------------------------------------------------------------------

-- vim.keymap.set('n', '<leader>b', '<plug>(foo)')

-- vim.keymap.set('n', '<leader>,', function()
--   local bufopt = {
--     listed = true,
--     hidden = true,
--   }
--
--   local api = vim.api
--   local file_name = vim.fs.normalize('~/test.txt')
--   vim.notify('created buffer: ' .. file_name, vim.log.levels.INFO)
--   local buffer_id = api.nvim_create_buf(bufopt.listed, bufopt.hidden)
--   api.nvim_set_option_value('buftype', nil, { buf = buffer_id })
--
--   api.nvim_buf_set_name(buffer_id, file_name)
--   vim.fn.bufload(buffer_id)
-- end)


vim.api.nvim_create_autocmd({ 'BufRead' }, {
  desc = 'Scroll to first heading and put it on top',
  pattern = { '*.md' },
  callback = function()
    log_d('buf new')
    -- vim.cmd('execute "normal! 2Gz\\<cr>"')
    vim.cmd('execute "normal! /^# \\<cr>z\\<cr>"')
    vim.cmd.nohlsearch()
  end,
})
