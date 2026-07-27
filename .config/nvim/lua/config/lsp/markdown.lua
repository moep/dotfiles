---@type vim.lsp.Config
vim.lsp.config.markdown =  {
  cmd = { 'markdown-oxide' },
  root_markers = { '.git', '.obsidian', '.moxide.toml' },
  filetypes = { 'markdown' },
}
