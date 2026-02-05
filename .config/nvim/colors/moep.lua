-- print('hello from colors/moep.lua mode: ' .. vim.go.bg)
-- custom highlights
local gray = '#999999'

vim.api.nvim_set_hl(0, 'moep.mode.normal', { fg = '#ffffff', bg = '#222222' })
vim.api.nvim_set_hl(0, 'moep.mode.visual', { fg = '#222222', bg = '#ba9cf3' })
vim.api.nvim_set_hl(0, 'moep.mode.select', { link = 'moep.mode.visual' })
vim.api.nvim_set_hl(0, 'moep.mode.insert', { fg = '#222222', bg = '#9dd274' })
vim.api.nvim_set_hl(0, 'moep.mode.replace', { fg = '#222222', bg = '#ff6578' })
vim.api.nvim_set_hl(0, 'moep.mode.command', { fg = '#222222', bg = '#ffffff' })
vim.api.nvim_set_hl(0, 'moep.mode.ex', { fg = '#222222', bg = '#eacb64' })
vim.api.nvim_set_hl(0, 'moep.mode.prompt', { fg = '#222222', bg = '#ffffff' })
vim.api.nvim_set_hl(0, 'moep.sl.fileprefix', { fg = gray })

