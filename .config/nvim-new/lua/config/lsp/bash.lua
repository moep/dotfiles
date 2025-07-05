print('hello from lua/config/lsp/bash.lua')

vim.lsp.config.bash = {
  cmd = { 'bash-language-server' },
  filetypes = { 'bash', 'sh' },
}
