vim.api.nvim_create_autocmd('FileType', {
  -- pattern = { '*.c', '*.h', '*.go', '*.lua', '*.sh', '*.bash' },
  callback = function(event)
    print('Starting treesitter for buffer ' .. event.buf)
    local success, _ = pcall(vim.treesitter.start, event.buf)

    if (success) then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

  end
})

-- vim.treesitter.language.add('lua', { path = '/path/to/lua.so' })
vim.treesitter.language.register('lua', { 'lua' })
