-- TODO see https://sbulav.github.io/vim/neovim-setting-up-luasnip/
--      and https://github.com/sbulav/dotfiles/blob/master/nvim/lua/config/snippets.lua
local luasnip = require("luasnip")

luasnip.config.set_config {
  history = true,
  ext_base_prio = 200,
  ext_prio_increase = 1,
  enable_autosnippets = false,
  store_selection_keys = "<c-s>",
}

luasnip.add_snippets(nil, {
  bash = {
    luasnip.snippet("shebang", {
      luasnip.text_node({ "#!/usr/bin/env bash", "", "" }),
      luasnip.insert_node(0),
    }),
  },
  lua = {
    luasnip.snippet("shebang", {
      luasnip.text_node({ "#!/usr/bin/env lua", "", "" }),
      luasnip.insert_node(0),
    }),
  },
})

