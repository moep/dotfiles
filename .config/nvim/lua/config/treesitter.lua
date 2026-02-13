local function log_d(message)
  vim.notify('[treesitter] ' .. message)
end

vim.api.nvim_create_augroup('moep', { clear = true })
vim.api.nvim_create_autocmd('BufEnter', {
  group = 'moep',
  -- pattern = { '*.c', '*.h', '*.go', '*.lua', '*.sh', '*.bash' },
  callback = function(event)
    log_d('Starting treesitter for buffer ' .. event.buf)
    local success, _ = pcall(vim.treesitter.start, event.buf)

    if (success) then
      vim.wo.foldmethod = 'expr'
      vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

  end
})

-- vim.treesitter.language.add('lua', { path = '/path/to/lua.so' })
-- vim.treesitter.language.register('lua', { 'lua' })
