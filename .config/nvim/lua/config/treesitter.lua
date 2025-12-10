vim.api.nvim_create_autocmd("filetype", {
  callback = function(event)
    print('Starting treesitter for buffer ' .. event.buf)
    pcall(vim.treesitter.start, event.buf)
  end
})

-- vim.treesitter.language.add('lua', { path = '/path/to/lua.so' })
vim.treesitter.language.register('lua', { 'lua' })
