-- https://www.reddit.com/r/neovim/comments/wdiv4p/setting_up_neovim_with_lsp_and_clangd/

--
-- LSP
--
local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  vim.notify("Could not initialize LSP config.", vim.log.levels.ERROR)
  return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, buf_nr)
  vim.notify("on_attach", vim.log.levels.TRACE)

  -- Autoformat on save
  if client.server_capabilities.documentFormattingProvider then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = vim.api.nvim_create_augroup("Format", { clear = true }),
      buffer = buf_nr,
      callback = function()
        vim.lsp.buf.formatting_seq_sync()
      end
    })
  end

end

--
-- Server
--
local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_ok then
  return
end
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Clangd
nvim_lsp.clangd.setup({
  cmd = { "clangd13" }
})

nvim_lsp.lua_ls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        }
      },
    },
  },
})

-- Dummy
require("lsp.fools")
nvim_lsp.tsserver.setup {}
nvim_lsp.fools.setup {}

---
--- Singature Completion
---
local cfg = {
  hint_prefix = "",
}
require("lsp_signature").setup(cfg)
