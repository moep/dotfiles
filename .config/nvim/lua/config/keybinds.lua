--
-- Snacks Picker
--

vim.keymap.set('n', '<leader>sP', function() Snacks.picker.smart() end)
vim.keymap.set('n', '<leader>sp', function()
  Snacks.picker.files(
    ---@class snacks.picker.files.Config: snacks.picker.proc.Config
    ---@field cmd? "fd"| "rg"| "find" command to use. Leave empty to auto-detect
    ---@field hidden? boolean show hidden files
    ---@field ignored? boolean show ignored files
    ---@field dirs? string[] directories to search
    ---@field follow? boolean follow symlinks
    ---@field exclude? string[] exclude patterns
    ---@field args? string[] additional arguments
    ---@field ft? string|string[] file extension(s)
    ---@field rtp? boolean search in runtimepath 
    {
      cmd = 'fd',
      follow = true,
      args = {'--no-ignore'},
      rtp = false,
    })
  end)
vim.keymap.set('n', '<leader>sb', function() Snacks.picker.buffers() end)
vim.keymap.set('n', '<leader>s/', function() Snacks.picker.lines() end)
vim.keymap.set('n', '<leader>sf', function() Snacks.picker.grep() end)
vim.keymap.set('n', '<leader>sF', function() Snacks.picker.grep_buffers() end)
vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end)
vim.keymap.set('n', '<leader>s\'', function() Snacks.picker.marks() end)

-- Snacks Picker LSP
vim.keymap.set('n', '<leader>sdl', function() Snacks.picker.loclist() end)
vim.keymap.set('n', '<leader>sdd', function() Snacks.picker.diagnostics() end)
vim.keymap.set('n', '<leader>sdD', function() Snacks.picker.diagnostics_buffer() end)
vim.keymap.set('n', '<leader>so', function() Snacks.picker.lsp_symbols() end)
vim.keymap.set('n', '<leader>sO', function() Snacks.picker.lsp_workspace_symbols() end)
vim.keymap.set('n', 'T', function() Snacks.picker.explorer() end)

--
-- flash.nvim
--
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end)
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end)
