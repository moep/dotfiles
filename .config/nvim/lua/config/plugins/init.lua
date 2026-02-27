local M = {}

-- helper functions ------------------------------------------------------------

local log = require('util.logger')

---@param message string
local function log_t(message)
  log.trace(message, 'plugins')
end

---@param message string
local function log_d(message)
  log.debug(message, 'plugins')
end

-- type definitions ------------------------------------------------------------

---@class plugin_info
---@field url string
---@field setup? function()
  ---
---@class myspec:vim.pack.Spec vim.pack specification with a fixed `data` type
---@field data? myspec.data

---@class myspec.data
---@field setup? function()


---@type table<moepconf.plugin_name, myspec>
local plugins = {
  ['flash.nvim'] = { src = 'https://github.com/folke/flash.nvim' },
  ['mini.icons'] = { src = 'https://github.com/nvim-mini/mini.icons' },
  ['mini.nvim'] = { src = 'https://github.com/echasnovski/mini.nvim' } ,
  ['nvim-treesitter'] = { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  ['snacks.nvim'] = {  src = 'https://github.com/folke/snacks.nvim', data = { setup = require('config.plugins.snacks').setup } },
  ['render-markdown.nvim'] = { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim', data = { setup = require('config.plugins.render_markdown').setup } },

  -- colorschemes
  ['papercolor-theme'] = { src = 'https://github.com/NLKNguyen/papercolor-theme' },
  ['silkcircuit-nvim'] = { src = 'https://github.com/hyperb1iss/silkcircuit-nvim' },
  ['sonokai'] = { src = 'https://github.com/sainnhe/sonokai' },

  -- colorschemes for evaluation
  -- TODO should setup functions be executed via autocmd?
  ['koda.nvim'] = { src = 'https://github.com/oskarnurm/koda.nvim' },
  ['silentium.nvim'] = { src = 'https://github.com/silentium-theme/silentium.nvim', data = { setup = function()
    -- local silentium = require("silentium")
    -- silentium.setup({ accent = silentium.accents.peach })
    end}},
  ['cobalt.nvim'] = { src = 'https://github.com/wurli/cobalt.nvim' },
  ['min-theme.nvim'] = { src = 'https://github.com/datsfilipe/min-theme.nvim' },
  ['witch'] = { src = 'https://github.com/sontungexpt/witch' },
  ['oxycarbon.nvim'] = { src = 'https://github.com/nyoom-engineering/oxocarbon.nvim' },
  ['zephyr.nvim'] = { src = 'https://github.com/nvimdev/zephyr-nvim' },
  ['edge'] = { src = 'https://github.com/sainnhe/edge' },
  ['onedark.nvim'] = { src = 'https://github.com/navarasu/onedark.nvim' },
  ['everforest'] = { src = 'https://github.com/sainnhe/everforest' },
  ['kanagawa-paper.nvim'] = { src = 'https://github.com/thesimonho/kanagawa-paper.nvim' },
  ['one_monokai.nvim'] = { src = 'https://github.com/cpea2506/one_monokai.nvim' },
  ['fluormachine.nvim'] = { src = 'https://github.com/maxmx03/fluoromachine.nvim' },
  ['deepwhite.nvim'] = { src = 'https://github.com/Verf/deepwhite.nvim' },
  ['cyberdream.nvim'] = { src = 'https://github.com/scottmckendry/cyberdream.nvim' },
  ['halfspace.nvim'] = { src = 'https://gitlab.com/sxwpb/halfspace.nvim' },
  ['bluloco.nvim'] = { src = 'https://github.com/uloco/bluloco.nvim' },
  ['base16-pro-max.nvim'] = { src = 'https://github.com/y3owk1n/base16-pro-max.nvim' },
  ['thorn.nvim'] = { src = 'https://github.com/jpwol/thorn.nvim' },
}

-- common plugins --------------------------------------------------------------

---@type vim.pack.Spec[]
local plugins_core = {
  -- color schemes
  -- { src = 'https://github.com/sainnhe/sonokai', confirm = false },

  -- faster find navigation
  -- { src = 'https://github.com/folke/flash.nvim', confirm = false },

  -- only used for picker
  -- { src = 'https://github.com/folke/snacks.nvim', confirm = false },

  -- used for completion
  -- { src = 'https://github.com/echasnovski/mini.nvim', confirm = false },

  -- only commented in for installing grammars
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
}

-- note taking plugins ---------------------------------------------------------

-- TODO replace with vim.g.moepconf.xxxxx
---@type vim.pack.Spec[]
local plugins_notes = {
  -- color schemes
  -- { src = 'https://github.com/hyperb1iss/silkcircuit-nvim', confirm = false },
  -- { src = 'https://github.com/NLKNguyen/papercolor-theme', confirm = false },

  -- markdown concealing
  -- { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },

  -- icons for render-markdown
  -- { src = 'https://github.com/nvim-mini/mini.icons' },

}

-- vim.pack actions ------------------------------------------------------------

---@type vim.pack.Spec[]
local specs = {
}

for _, value in ipairs(vim.g.moepconf.plugins) do
  table.insert(specs, plugins[value])
end
vim.pack.add(specs)

for _, value in ipairs(vim.g.moepconf.plugins) do
  log_t('data for ' .. value .. ' = ' .. vim.inspect(plugins[value].data))

  if plugins[value].data and plugins[value].data.setup then
    log_t('exec setup for ' .. value)
    plugins[value].data.setup()
  end
end

local active_plugins = vim.iter(vim.pack.get())
  :filter(function(x) return x.active end)
  :map(function(x) return x.spec.name end)
  :totable()

log_d('active plugins: ' .. vim.inspect(active_plugins))
