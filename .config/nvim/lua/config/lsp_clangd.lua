local nvim_lsp = require'lspconfig'.clangd.setup{
    cmd = { 'clangd12' },
    filetypes = { 'c', 'cpp', 'objc', 'objcpp' },
}

