---@meta
--- For hinting only
--- DO NOT INCLUDE!

---@class MoepObject
---@field foo string
---@field bar string
MoepObject = {}

---@alias moepconf.lsp
--- | 'bash'
--- | 'clangd'
--- | 'go'
--- | 'lua'
--- | 'markdown'

---@alias moepconf.colorscheme
--- | 'default',
--- | 'sonokai'
--- | 'silkcircuit'

---@alias moepconf.plugin_name
--- | 'flash.nvim' 
--- | 'mini.icons'
--- | 'mini.nvim' 
--- | 'nvim-treesitter'
--- | 'papercolor-theme'
--- | 'render-markdown.nvim'
--- | 'silkcicuit.nvim'
--- | 'snacks.nvim' 
--- | 'sonokai'

---@class moepconf
---@field colorscheme moepconf.colorscheme
---@field loglevel? vim.log.levels Log level for this config's logs only
---@field lsps? moepconf.lsp[]
---@field plugins? moepconf.plugin_name[]
moepconf = {}

