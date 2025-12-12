vim.lsp.log.set_level('WARN')

-- vim.diagnostic.show() / hide()
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
      min = vim.diagnostic.severity.WARN,
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

    vim.b.foldmethod = 'expr'
    vim.b.foldexpr = 'v:lua.vim.lsp.foldexpr()'

    print('attached client with id ' .. event.data.client_id)
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

-- TODO BufEnter for each file (ftplugin/)
-- vim.api.nvim_create_autocmd('UiEnter', {
--   group = LSP_GROUP,
--   callback = function()
--     print('starting treesitter')
--     vim.treesitter.start()
--   end
-- })


--
-- language specific LSP configs
--

require('config.lsp.lua')
vim.lsp.enable('lua')

require('config.lsp.bash')
vim.lsp.enable('bash')

require('config.lsp.c')
vim.lsp.enable('clangd')

require('config.lsp.go')
vim.lsp.enable('go')
