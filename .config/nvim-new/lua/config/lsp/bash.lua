vim.notify('hello from lua/config/lsp/bash.lua', vim.log.levels.TRACE)

vim.lsp.config.bash = {
  cmd = { 'bash-language-server' },
  filetypes = { 'bash', 'sh' },
}
