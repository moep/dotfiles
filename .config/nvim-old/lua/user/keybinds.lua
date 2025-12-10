require("utils")
local telescope = require('telescope.builtin')

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

-- Telescope
nnoremap("<leader>p", telescope.find_files, "Telescope: Find Files by Name")
nnoremap("<leader>f", telescope.live_grep, "Telescope: Find in Files")
nnoremap("<leader>e", telescope.buffers, "Telescope: Buffers")
nnoremap("<leader>m", telescope.marks, "Telescope: Show marks")
nnoremap("<leader>o", telescope.lsp_document_symbols, "Telescope: Show document symbols")
nnoremap("<leader>r", telescope.lsp_references, "Telescope: Show symbol references")
inoremap("<C-r>r", telescope.registers, "Telescope: Show registers")

-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(event)
    -- <C-x><C-o>
    vim.bo[event.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

    -- See ':h vim.lsp.*'
    nnoremap("gD", vim.lsp.buf.declaration, "[LSP] Go to declaration")
    nnoremap("gd", vim.lsp.buf.definition, "[LSP] Go to definition")
    nnoremap("gi", vim.lsp.buf.implementation, "[LSP] Go to implementation")
    --nnoremap("gr", vim.lsp.buf.references, "[LSP] Show references")
    nnoremap("<leader>s", vim.lsp.buf.signature_help, "[LSP] Show signature information")
    --nnoremap("<leader>L", vim.lsp.buf.open_float, "[LSP] Show diagnostics")
    nnoremap("K", vim.lsp.buf.hover, "[LSP] Show hover information")
    nnoremap("<F2>", vim.lsp.buf.rename, "[LSP] Rename")
    nnoremap("<leader>q", vim.lsp.buf.code_action, "[LSP] Quick fix")

    -- Trouble
    local trouble = require("trouble")
    nnoremap("<leader>xx", function() trouble.toggle("document_diagnostics") end, "[Trouble] Open")
    nnoremap("<leader>xw", function() trouble.toggle("workspace_diagnostics") end, "[Trouble] Open")
    nnoremap("<leader>xq", function() trouble.toggle("quickfix") end, "[Trouble] Open")
    nnoremap("gr", function() trouble.toggle("lsp_references") end, "[LSP] Show references")

    --vim.keymap.set("n", "<leader>xx", function() require("trouble").open() end)
    --vim.keymap.set("n", "<leader>xw", function() require("trouble").open("workspace_diagnostics") end)
    --vim.keymap.set("n", "<leader>xd", function() require("trouble").open("document_diagnostics") end)
    --vim.keymap.set("n", "<leader>xq", function() require("trouble").open("quickfix") end)
    --vim.keymap.set("n", "<leader>xl", function() require("trouble").open("loclist") end)
    --vim.keymap.set("n", "gR", function() require("trouble").open("lsp_references") end)
  end
})
