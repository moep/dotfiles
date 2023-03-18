require("nvim-tree").setup()
require("nvim-web-devicons").setup()

-- TODO In Userconfig
vim.api.nvim_set_keymap("n", "T", ":NvimTreeToggle<CR>", { noremap = true, silent = true })
