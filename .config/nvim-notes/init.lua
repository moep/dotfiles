
--
-- 3rd party plugins
--
vim.pack.add({
  { src = 'https://github.com/MeanderingProgrammer/render-markdown.nvim', version='v1.0.0' },

  -- faster find navigation
  { src = 'https://github.com/folke/flash.nvim' },

  -- only used for picker
  { src = 'https://github.com/folke/snacks.nvim' },

  -- used for completion
  { src = 'https://github.com/echasnovski/mini.nvim' },

  { src = 'https://github.com/NLKNguyen/papercolor-theme' },
  { src = 'https://github.com/folke/tokyonight.nvim', version = 'v4.14.1' },
  { src = 'https://github.com/cocopon/iceberg.vim' },
  { src = 'https://github.com/hyperb1iss/silkcircuit-nvim' },


  { src = 'https://github.com/nvim-treesitter/nvim-treesitter' },
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/nvim-mini/mini.icons' },

})


-- 
-- diy 
--
require('config.user')
require('statusline')
-- require('config.lsp')
require('config.keybinds')
-- require('config.treesitter')



-- other plugins
require('snacks').setup({
    picker = { enabled = true },
})

require('mini.completion').setup({})

-- TODO luaify
vim.cmd([[au FileType snacks_picker_input lua vim.b.minicompletion_disable = true]])

-----------------------
vim.go.bg = 'dark'
vim.o.termguicolors = true
require('silkcircuit').setup({
  variant = 'glow',
})
vim.cmd.colorscheme('silkcircuit')
-- vim.cmd.colorscheme('iceberg')
-- vim.cmd.colorscheme('PaperColor')
-- vim.cmd.colorscheme('tokyonight-day')

require('mini.icons').setup()

vim.api.nvim_create_autocmd('FileType', {
  -- pattern = { '*.md' },
  callback = function(event)
    local success, _ = pcall(vim.treesitter.start, event.buf)

    if (success) then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
    end
  end
})

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

vim.diagnostic.config({
  virtual_text = {
    -- source = "always",  -- Or "if_many"
    -- prefix = 'x', -- Could be '■', '▎', 'x'
    prefix = 'x',
  },
  severity_sort = true,
  float = {
    source = "if_many", -- Or "if_many"
  },
  loclist = {
    open = true,
    severity = {
      min = vim.diagnostic.severity.HINT,
    },
  },
})

local LSP_GROUP = vim.api.nvim_create_augroup("LspMappings", { clear = true })

-- refresh loclist when LSP updates diagnostic info
vim.api.nvim_create_autocmd('DiagnosticChanged', {
  group = LSP_GROUP,
  callback = function()
    vim.diagnostic.setloclist({open = false})
  end,
})

-- enable LSP completion per buffer on attach
vim.api.nvim_create_autocmd('LspAttach', {
  group = LSP_GROUP,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client == nil then return end

    vim.b.signcolumn = 'auto:1'

    -- print('attached client with id ' .. event.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, event.buf, {
        autotrigger = true,
        convert = function(item)
          return {
            abbr = item.label
          }
        end,
      })
    end

    -- TODO move to lua/config/keys.lua
    vim.keymap.set('i', '<C-n>', vim.lsp.completion.get, { desc = 'trigger autocompletion' })

    -- TODO https://davelage.com/posts/neovim-lsp-attach-autocommand/
  end,
})

-- set current working dir to notes folder
-- TODO https://vi.stackexchange.com/questions/34871/set-current-working-directory-when-opening-vim/47127#47127
vim.api.nvim_set_current_dir('/home/moep/notes')
vim.lsp.enable('marksman')

vim.keymap.set('n', 'gd', function()
  vim.lsp.buf.definition()
end, { desc = 'goto definition' })

vim.keymap.set('n', '<leader>mm', function()
  require('render-markdown').buf_toggle()
end, { desc = 'goto definition' })

vim.keymap.set('n', '<leader>,', function() 
  vim.api.nvim_feedkeys('2Gz<cr>', 'n', true);
end)
