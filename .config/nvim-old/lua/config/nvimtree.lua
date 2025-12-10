require("nvim-tree").setup({
  disable_netrw = true,
  sort_by = "name",
  sync_root_with_cwd = true,
  filters = {
    dotfiles = true,
    git_clean = false,
    no_buffer = false,
  },
  git = {
    enable = true,
    ignore = false,
  },
  modified = {
    enable = true,
  }
})
require("nvim-web-devicons").setup()

