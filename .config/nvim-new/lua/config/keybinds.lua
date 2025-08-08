--
-- Snacks Picker
--

vim.keymap.set('n', '<leader>sp', function() Snacks.picker.smart() end)
vim.keymap.set('n', '<leader>sP', function() Snacks.picker.files() end)
vim.keymap.set('n', '<leader>sb', function() Snacks.picker.buffers() end)
vim.keymap.set('n', '<leader>s/', function() Snacks.picker.lines() end)
vim.keymap.set('n', '<leader>sf', function() Snacks.picker.grep() end)
vim.keymap.set('n', '<leader>sF', function() Snacks.picker.grep_buffers() end)
vim.keymap.set('n', '<leader>s"', function() Snacks.picker.registers() end)
vim.keymap.set('n', '<leader>s\'', function() Snacks.picker.marks() end)

-- Snacks Picker LSP
vim.keymap.set('n', '<leader>sdl"', function() Snacks.picker.loclist() end)
vim.keymap.set('n', '<leader>sdd"', function() Snacks.picker.diagnostics() end)
vim.keymap.set('n', '<leader>sdD"', function() Snacks.picker.diagnostics_buffer() end)
vim.keymap.set('n', '<leader>so', function() Snacks.picker.lsp_symbols() end)
vim.keymap.set('n', '<leader>sO', function() Snacks.picker.lsp_workspace_symbols() end)

--
-- flash.nvim
--
vim.keymap.set({ 'n', 'x', 'o' }, 's', function() require('flash').jump() end)
vim.keymap.set({ 'n', 'x', 'o' }, 'S', function() require('flash').treesitter() end)
