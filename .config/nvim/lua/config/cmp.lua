local status, cmp = pcall(require, "cmp")
if (not status) then
  vim.notify("Could not initialize CMP config.", vim.log.levels.ERROR)
  return
end

cmp.setup({
  snipptet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  --mapping = cmp.mapping.preset.insert({
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
  --  ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
  --  ["<CR>"] = cmp.mapping.confirm({
  --    behavior = cmp.ConfirmBehavior.Replace,
  --    select = true,
  --  }),
  --}),
  
  mapping = cmp.mapping.preset.insert {
    ["<CR>"] = cmp.mapping.confirm({ 
      select = true 
    }),

    ["<C-n>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<C-p>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallaback()
      end
    end, { "i", "s" }),
  },

  sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "luasnip" },
  }),

  formatting = {

  },
})

cmp.setup.cmdline({ "/", "?"}, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline({ ":" }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
require("lspconfig")["tsserver"].setup({
  capabilities = capabilities 
})

--vim.cmd [[
--  set completeopt=menuone,noinsert,noselect
--  highlight! default link CmpItemKind CmpItemMenuDefault
--]]

--vim.notify("CMP initialized", vim.log.levels.DEBUG)
