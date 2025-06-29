vim.lsp.set_log_level("trace")

-- TODO howto change VIMRUNTIME for user path nvim?
--   does not work:
--   https://stackoverflow.com/questions/73358168/where-can-i-check-my-neovim-lua-runtimepath
--   lua print(vim.inspect(vim.api.nvim_list_runtime_paths()))
--vim.opt.runtimepath:prepend("~/.local/ports/nvim/runtimepath/,")
--vim.o.path = vim.o.path .. "~/.local/ports/nvim/runtimepath/"

local function include(module)
  package.loaded[module] = nil
  return require(module)
end

include("plugins")

include("user.settings").init({
  colorscheme = "catppuccin-mocha"
})
include("user.keybinds")

include("config.cmp")
include("config.lsp")
include("config.telescope")
include("config.feline")
include("config.trouble")

-- kopieren von
-- https://github.com/GideonWolfe/nvim-lua/blob/main/lua/settings.lua

vim.cmd([[echohl Error | echo "(V) (°,,,°) (V)" | echohl None]])
