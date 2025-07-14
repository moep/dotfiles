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
require('vim._extui').enable({
  enable = true,
  msg = {
    ---@type 'cmd'|'msg'
    target = 'msg',
    timeout = 6000, -- Time a message is visible in the message window.
  },
})

vim.notify('hello from init.lua', vim.log.levels.TRACE)

--
-- 3rd party plugins
--
vim.pack.add({
  -- color scheme
  { src = 'https://github.com/sainnhe/sonokai' },

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

-- plugin under local development
vim.opt.runtimepath:prepend('/home/moep/code/nvim/nbish.nvim/')
require('nbish.types')
--
---@type nbishConfig
vim.g.nbish_config = {
  nb_root = '~/.local/share/nb2'
}
require('nbish')

-- vim.treesitter.language.register('xxx', { 'md2' })
-- vim.treesitter.language.add('xxx', { 'xxx.so' })

vim.keymap.set('n', '<leader>a', function()
  vim.notify('reload', vim.log.levels.INFO)
  vim.cmd('source init.lua')
end)
vim.keymap.set('n', '<leader>b', '<plug>(foo)')
