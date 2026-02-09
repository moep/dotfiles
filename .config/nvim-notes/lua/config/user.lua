vim.g.mapleader = ','
vim.g.localleader = ','

-- hide command line if not in use
-- vim.opt.cmdheight = 0

-- Status line
-- (might be ignored by custom statusline implementation)
-- vim.opt.ruler = true
-- vim.opt.laststatus = 2
vim.o.showmode = false

-- Don't parse last lines for vim commands
vim.opt.modelines = 0
-- hide buffers
-- vim.opt.hidden = true

-- less strict find and search
vim.opt.path:append('**')
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.infercase = true
vim.opt.wildignorecase = true
vim.opt.wildignore:append({ '.git', '*.tmp', '*.o', '*.obj' });

-- search highlight
-- vim.opt.hlsearch = true
-- vim.opt.incsearch = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true

--' better backspace handling
-- vim.opt.backspace = 'indent,eol,start'
vim.opt.softtabstop = 2

-- indent 2 spaces; every 2 spaces
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- replace tabs with spaces
vim.opt.expandtab = true

-- autoindent
-- vim.opt.autoindent = true

-- no line wrapping
--vim.opt.nowrap = true

vim.opt.foldenable = true
-- use treesitter for folding 
-- TODO this should be handled per buffer on lsp_attach
-- vim.opt.foldmethod = 'expr'
-- vim.opt.foldexpr = 'vim.treesitter#foldexpr()'
-- use :mkview :loadview to save folds
-- vim.opt.foldmethod = 'manual'
vim.opt.foldcolumn = '2'
vim.opt.foldtext = ''
-- open all folds by default
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 5
vim.opt.foldnestmax = 4

-- highlight current line
vim.opt.cursorline = true

-- prevent the built-in vim.lsp.completion autotrigger from selecting the first item
-- vim.opt.completeopt = { 'menuone', 'noselect', 'popup' }
vim.opt.completeopt = { 'menuone', 'noselect', 'fuzzy', 'nosort' }

-- vim.opt.winborder = 'none'

-- show non-printable characters on :set list
vim.opt.listchars = {
  space = '.',
  nbsp = '_',
  trail = ':',
  extends = '»',
  precedes = '«',
  eol = '\\',
}

vim.o.undofile = false
-- vim.o.undodir = vim.fn.stdpath('cache') .. '/undo'
vim.o.backup = true
vim.o.backupdir = vim.fn.stdpath('data') .. '/backup'

-- preview :s/foo/bar/
-- vim.o.inccommand = 'nosplit'

vim.opt.cursorline = true
-- vim.opt.cursorcolumn = false

-- color scheme
vim.go.bg = 'dark'
vim.g.sonokai_style = 'atlantis'
-- vim.cmd.colorscheme('sonokai')
-- adds custom highlight groups
-- vim.cmd.colorscheme('moep')

-- TODO check if termguicolors supported and change color theme accordingly?
--      or create a seperate config
-- vim.o.termguicolors = true
-- require('silkcircuit').setup({
--   variant = 'glow',
-- })
-- vim.cmd.colorscheme('silkcircuit')

--
-- User commands
--
vim.api.nvim_create_user_command('Scratch', function()
  vim.cmd('tabnew [SCRATCH]')
  local buf = vim.api.nvim_get_current_buf()
  vim.api.nvim_set_option_value('bufhidden', 'hide', { buf = buf })
  vim.api.nvim_set_option_value('buflisted', true, { buf = buf })
  vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf })
  vim.api.nvim_set_option_value('swapfile', false, { buf = buf })
  vim.api.nvim_set_option_value('fileencoding', 'utf-8', { buf = buf })
end, {})
