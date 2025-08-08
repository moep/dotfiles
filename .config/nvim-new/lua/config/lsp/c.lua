vim.lsp.config.clangd = {
  cmd = { 'clangd' },
  filetypes = { 'c', 'cpp', 'cuda', 'proto' },
  capabilities = {
    textDocument = {
      completion = {
        editsNearCursor = true,
      },
    },
  },
  offsetEncoding = { 'utf-8', 'utf-16' },
}

