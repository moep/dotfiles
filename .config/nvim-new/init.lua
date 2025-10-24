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
vim.loader.enable()

-- EXPERIMENTAL!
-- Removes 'Press ENTER or type command to continue'
-- Use g< or :mess to show messages
-- require('vim._extui').enable({
--   enable = true,
--   msg = {
--     ---@type 'cmd'|'msg'
--     target = 'cmd',
--     timeout = 3000, -- Time a message is visible in the message window.
--   },
-- })


--
-- 3rd party plugins
--
vim.pack.add({
  -- color scheme
  { src = 'https://github.com/sainnhe/sonokai' },
  { src = 'https://github.com/hyperb1iss/silkcircuit-nvim' },

  -- faster find navigation
  { src = 'https://github.com/folke/flash.nvim' },

  -- only used for picker
  { src = 'https://github.com/folke/snacks.nvim' },

  -- used for completion
  { src = 'https://github.com/echasnovski/mini.nvim' },

  -- tmp
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
})


-- 
-- diy 
--
require('config.user')
-- TODO https://gist.github.com/emersonfbarros/041578c0419a5e186820365266b3d094
require('statusline')
require('config.lsp')
require('config.keybinds')

-- plugin under local development
-- vim.opt.runtimepath:prepend('/home/moep/code/nvim/nbish.nvim/')
-- require('nbish.types')
--
-- ---@type nbishConfig
-- vim.g.nbish_config = {
--   nb_root = '~/.local/share/nb2'
-- }
-- require('nbish')


-- other plugins
require('snacks').setup({
    picker = { enabled = true },
})

require('mini.completion').setup({})

-- for debugging purposes
vim.keymap.set('n', '<leader>a', function()
  vim.notify('reload', vim.log.levels.INFO)
  vim.cmd('source init.lua')
  -- vim.cmd('restart')
end)

vim.keymap.set('n', '<leader>b', '<plug>(foo)')
vim.keymap.set('n', '<leader>,', function()
  local bufopt = {
    listed = true,
    hidden = true,
  }

  local api = vim.api
  local file_name = vim.fs.normalize('~/test.txt')
  vim.notify('created buffer: ' .. file_name, vim.log.levels.INFO)
  local buffer_id = api.nvim_create_buf(bufopt.listed, bufopt.hidden)
  api.nvim_set_option_value('buftype', nil, { buf = buffer_id })

  api.nvim_buf_set_name(buffer_id, file_name)
  vim.fn.bufload(buffer_id)
end)

