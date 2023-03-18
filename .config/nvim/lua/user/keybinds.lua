-- LSP KEYBINDS -------------------------------------------------------
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event) 
    -- <C-x><C-o>
    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- See ':h vim.lsp.*'
    local opts = { buffer = event.buf }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)

  end
})

