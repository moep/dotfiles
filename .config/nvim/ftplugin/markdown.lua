local GROUP = vim.api.nvim_create_augroup('markdown_detected', { clear = true })
vim.api.nvim_create_autocmd({'BufEnter'}, {
  group = GROUP,
  callback = function()
    print('BufEnter for ftplugin/markdown.lua')
  end,
})
