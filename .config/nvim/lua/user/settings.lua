local M = {}

-- Init default options and overwrite them with existing options from opts.
-- @param user_opts Options to initialize
local function init_default_opts(user_opts)
  local default_opts = {
    colorscheme = "default",
  }

  M.opts = vim.tbl_extend("force", default_opts, user_opts)
end

function M.init(opts)
  init_default_opts(opts)

  -- use systems vim settings
  vim.env.PATH = "/usr/share/vim/vimfiles" .. vim.env.PATH
  vim.env.PATH = "/usr/local/share/vim/vimfiles" .. vim.env.PATH

  -- use vim settings instead of vi
  -- TODO deprecated in nvim?
  --vim.opt.nocompatible = true

  -- enable mouse in all modes
  vim.o.mouse = "a"

  -- colorscheme
  local colorterm = vim.env.COLORTERM
  if colorterm ~= "truecolor" then
    -- TTY mode
    vim.opt.termguicolors = false
    --vim.cmd("colorscheme pablo")
    vim.cmd("colorscheme 256_noir")
  else
    -- Desktop mode
    vim.opt.termguicolors = true
    vim.cmd("colorscheme " .. M.opts.colorscheme)
  end

  -- Status line
  vim.opt.ruler = true
  vim.opt.laststatus = 2
  vim.o.showmode = false

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
  --vim.opt.nofoldenable = true

  -- highlight current line
  vim.opt.cursorline = true

  -- show non-printable characters
  vim.opt.listchars = {
    space = "␣",
    nbsp = "⍽",
    trail = ":",
    extends = "»",
    precedes = "«",
    eol = "⏎",
  }

  vim.o.undofile = true
  vim.o.undodir = vim.fn.stdpath("cache") .. "/undo"
  vim.o.backup = true
  vim.o.backupdir = vim.fn.stdpath("data") .. "/undo"

  -- preview :s/foo/bar/
  vim.o.inccommand = "nosplit"


  -- TODO autogroup
  -- TODO autoindex
  -- TODO c specific settings
  --
  -- TODO see https://stackoverflow.com/questions/71152802/how-to-override-color-scheme-in-neov im-lua-config-file
  vim.opt.cursorline = true
  vim.opt.cursorcolumn = false
end

return M
