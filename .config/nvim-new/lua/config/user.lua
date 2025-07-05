print('hello from lua/config/user.lua')
-- Status line
-- (might be ignored by custom statusline implementation)
vim.opt.ruler = true
vim.opt.laststatus = 2
-- vim.o.showmode = false

-- Don"t parse last lines for vim commands
vim.opt.modelines = 0
-- hide buffers
vim.opt.hidden = true

-- less strict find and search
vim.opt.path:append("**")
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ ".git", "*.tmp", "*.o", "*.obj" });

-- search highlight
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--" better backspace handling
vim.opt.backspace = "indent,eol,start"
vim.opt.softtabstop = 2

-- indent 2 spaces; every 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- replace tabs with spaces
vim.opt.expandtab = true

-- autoindent
vim.opt.autoindent = true

-- no line wrapping
--vim.opt.nowrap = true

-- no initial folding
-- TODO why does that not work?
vim.opt.foldenable = false
-- use treesitter for folding
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'vim.treesitter#foldexpr()'

-- highlight current line
vim.opt.cursorline = true

-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
vim.opt.completeopt = { "menuone", "noselect", "popup" }

vim.opt.winborder = 'none'

-- show non-printable characters on :set list
vim.opt.listchars = {
  space = ".",
  nbsp = "_",
  trail = ":",
  extends = "»",
  precedes = "«",
  eol = "\\",
}

vim.o.undofile = false
-- vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath("data") .. "/backup"

-- preview :s/foo/bar/
vim.o.inccommand = "nosplit"

vim.opt.cursorline = true
vim.opt.cursorcolumn = false

vim.g.sonokai_style = 'atlantis'
vim.go.bg = 'dark'
vim.cmd.colorscheme('sonokai')

