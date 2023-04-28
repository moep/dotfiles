include("utils")

vim.g.mapleader = "\\"
vim.g.mapllocaleader = ","

inoremap("jj", "<ESC>", "Exit insert mode")

-- Prevent accidentially entering ex mode
nnoremap("Q", "<NOP>")

-- Clear search highlightling with AltGr+/ (us-layout)
nnoremap("¿", ":nohlsearch<CR>", "Clear search highlightling")

-- Buffers
nnoremap("<leader>l", ":bn<CR>", "Next buffer")
nnoremap("<leader>h", ":bp<CR>", "Previous buffer")
nnoremap("<C-Right>", ":bn<CR>", "Next buffer")
nnoremap("<C-Left>", ":bp<CR>", "Previous buffer")
--nnoremap("<C-w>", ":bd<CR>", "Close current buffer")

-- Nvim Tree
nnoremap("T", ":NvimTreeToggle<CR>", "Toggle Nvim Tree")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event) 
    -- <C-x><C-o>
    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- See ':h vim.lsp.*'
    local opts = { buffer = event.buf }
    nnoremap("gD",  vim.lsp.buf.declaration, "[LSP] Go to declaration")
    nnoremap("gd",  vim.lsp.buf.definition, "[LSP] Go to definition")
    nnoremap("gr", vim.lsp.buf.references, "[LSP] Show references")
    nnoremap("<F2>", vim.lsp.buf.rename, "[LSP] Rename")
  end
})

