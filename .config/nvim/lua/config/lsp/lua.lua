-- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#lua_ls
vim.lsp.config.lua = {
  cmd = {
    'lua-language-server',
    '--checklevel=hint',
    '--loglevel=info',
  },
  filetypes = { 'lua' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = {
          'lua/?.lua',
          'lua/?/init.lua'
        },
      },
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          '/home/moep/code/nvim/nbish.nvim/',
          --vim.api.nvim_get_runtime_file('', true)
        },
      },
      hint = { enable = true },
      completion = { callSnippet = 'Replace' },
      telemetry = { enable = false },
      codeLens = { enable = true },
      diagnostics = {
        globals = { 'vim' },
      }
    },
  },
}
