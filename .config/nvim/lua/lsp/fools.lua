-- Custom language server example
local configs = require("lspconfig.configs")
local util = require("lspconfig.util")

configs.fools = {
  default_config = {
    cmd = { "clangd13" },
    filetypes = { "foo" },
    root_dir = util.path.dirname,
  },
  docs = {
    description = [[
no description yet
]],
    default_config = {
      root_dir = [[root_pattern(".git")]]
    },
  },
}


