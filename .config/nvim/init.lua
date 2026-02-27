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

-- mode set --------------------------------------------------------------------

---@diagnostic disable unused

---@alias moepconf.nvim_mode 'default' | 'notes' | 'minimal'


---@returns moepconf.nvim_mode
---@nodiscard
local function get_mode()
  -- TODO set mode according to PWD if NVIM_MODE is not set
  if vim.env.NVIM_MODE == nil or vim.env.NVIM_MODE == '' then
    return 'default'
  else
    return vim.env.NVIM_MODE
  end
end

-- Plugin list used for all modes
---@type moepconf.plugin_name[]
local plugins = { 'flash.nvim' }

if get_mode() ~= 'minimal' then
  -- Plugin list for all modes except minimal

  ---@type moepconf.plugin_name[]
  local plugins_default = { 
    'mini.nvim',
    'snacks.nvim',
    'sonokai',

    -- only used for looking up ts configs
    --'nvim-treesitter', 

    'koda.nvim',
    'silentium.nvim',
    'cobalt.nvim', -- nice blue theme
    'min-theme.nvim', -- good
    'witch', -- light theme looks good
    'oxycarbon.nvim', -- !! dark and bright
    'zephyr.nvim', -- okayish
    'edge',
    'onedark.nvim',
    'everforest', -- light looks good
    'kanagawa-paper.nvim', -- too bright; to pale
    'one_monokai.nvim', -- a little bit darker sonokai
    'fluormachine.nvim', -- alternative for silkcircuit; comments too pale
    'deepwhite.nvim', -- good bright
    'cyberdream.nvim', -- nice contrast
    'halfspace.nvim', -- oldschool gray; a little pale
    'bluloco.nvim', -- untested, needs lush
    'base16-pro-max.nvim', --not a color scheme
    'thorn.nvim', --green; lacks a little contrast

    -- :colo minischeme
  }

  for _, value in ipairs(plugins_default) do
    table.insert(plugins, value)
  end
end

if get_mode() == 'notes' then
  ---@type moepconf.plugin_name[]
  local plugins_notes = { 
    'silkcircuit-nvim',
    -- 'papercolor-theme',
    'render-markdown.nvim',
    'mini.icons' 
  }

  for _, value in ipairs(plugins_notes) do
    table.insert(plugins, value)
  end
end

---@type table<moepconf.nvim_mode, moepconf.colorscheme>
local color_schemes_for_mode = {
  ['minimal'] = 'default',
  ['default'] = 'sonokai',
  ['notes'] = 'silkcircuit', 
}

---@type moepconf
vim.g.moepconf = {
  colorscheme = color_schemes_for_mode[get_mode()],
  loglevel = vim.log.levels.TRACE,
  lsps = { 'lua' },
  plugins = plugins
}


local log = require('util.logger')
log.debug('mode: ' .. get_mode())
log.debug('config: ' .. vim.inspect(vim.g.moepconf))

-- 3rd party plugins -----------------------------------------------------------

require('config.plugins')

-- color schemes tweaking --------------------------------------------------------

-- TODO add to custom lua module?
vim.o.termguicolors = true
if vim.g.moepconf.colorscheme == 'sonokai' then
  vim.go.bg = 'dark'
  vim.g.sonokai_style = 'atlantis'
  vim.cmd.colorscheme('sonokai')
elseif vim.g.moepconf.colorscheme == 'silkcircuit' then
  -- TODO check if termguicolors supported and change color theme accordingly?
  --      or create a seperate config
  require('silkcircuit').setup({
    ---@type 'neon' | 'vibrant' | 'soft' | 'glow'
    variant = 'glow',
  })
  vim.cmd.colorscheme('silkcircuit')
else
  vim.cmd.colorscheme(vim.g.moepconf.colorscheme)
end

-- add highlight groups for my custom status line script
-- TODO should be part of sl.lua?
vim.cmd.colorscheme('moep')

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

-- TODO move to config/plugins/mini.lua
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


vim.api.nvim_create_autocmd('BufRead', {
  desc = 'Scroll to first heading and put it on top',
  pattern = { '*.md' },
  callback = function()
    log.debug('buf new')
    -- vim.cmd('execute "normal! 2Gz\\<cr>"')
    vim.cmd('execute "normal! /^# \\<cr>z\\<cr>"')
    vim.cmd.nohlsearch()
  end,
})

log.info('initialized')
