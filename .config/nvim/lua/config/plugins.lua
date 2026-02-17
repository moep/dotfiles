local plugins = {}

-- type definitions ------------------------------------------------------------

---@alias moepconf.knownPluginName 'flash.nvim' 
--- | 'mini.icons'
--- | 'mini.nvim' 
--- | 'papercolor-theme'
--- | 'render-markdown.nvim'
--- | 'silkcicuit.nvim'
--- | 'snacks.nvim' 
--- | 'sonokai'
--- | 'foo'

-- helper functions ------------------------------------------------------------

local function log_d(message)
  vim.api.nvim_echo({{'[plugins] ', '@comment'}, {message, '@comment'}}, true, {})
end

-- common plugins --------------------------------------------------------------

---@type vim.pack.Spec[]
local plugins_core = {
  -- color schemes
  { src = 'https://github.com/sainnhe/sonokai', confirm = false },

  -- faster find navigation
  { src = 'https://github.com/folke/flash.nvim', confirm = false },

  -- only used for picker
  { src = 'https://github.com/folke/snacks.nvim', confirm = false },

  -- used for completion
  { src = 'https://github.com/echasnovski/mini.nvim', confirm = false },

  -- only commented in for installing grammars
  -- { src = 'https://github.com/nvim-treesitter/nvim-treesitter' }
}

-- note taking plugins ---------------------------------------------------------

---@type vim.pack.Spec[]
local plugins_notes = {
  -- color schemes
  { src = 'https://github.com/hyperb1iss/silkcircuit-nvim', confirm = false },
  { src = 'https://github.com/NLKNguyen/papercolor-theme', confirm = false },

  -- markdown concealing
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim' },

  -- icons for render-markdown
  { src = 'https://github.com/nvim-mini/mini.icons' },

}

for _, value in ipairs(plugins_core) do
  table.insert(plugins, value)
end
if vim.g.nvim_mode == 'notes' then
  for _, value in ipairs(plugins_notes) do
    table.insert(plugins, value)
  end
end

-- vim.pack actions ------------------------------------------------------------

vim.pack.add(plugins)

-- plugin configs --------------------------------------------------------------

local active_plugins = vim.iter(vim.pack.get())
  :filter(function(x) return x.active end)
  :map(function(x) return x.spec.name end)
  :totable()

log_d(vim.inspect(active_plugins))

---@type moepconf.knownPluginName 
local plugin_name = 'snacks.nvim'
if vim.list_contains(active_plugins, plugin_name) then
  require('snacks').setup({
    picker = { enabled = true },
  })
  -- TODO luaify
  vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])
end

plugin_name = 'render-markdown.nvim'
if vim.list_contains(active_plugins, plugin_name) then
  require('render-markdown').setup({
    completions = { lsp = { enabled = true } },

    render_modes = { 'n' },

    anti_conceal = {
      enabled = false,
    },

    heading = {
      sign = false,
      position = 'inline',
      width = { 'full', 'full', 'block', 'block' },
      -- min_width = 80,
    },

    bullet = {
      left_pad = 2,
    },

    code = {
      position = 'left',
      width = 'block',
      right_pad = 2,
      left_pad = 2,
      language_border = ' ',
    },

    checkbox = {
      checked = { scope_highlight = '@markup.strikethrough' },
      custom = {
        moep = { raw = '[m]', rendered = 'xx ', left_pad = 2 },
      },
    },

    callout = {
      moep = { raw = '[!MOEP]', rendered = 'moep',  highlight = 'RenderMarkdownInfo', category = 'custom' },
    },

    link = {
    },

    sign = {
      enabled = false,
    },
  })
end

