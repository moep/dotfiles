-- https://www.reddit.com/r/neovim/comments/wdiv4p/setting_up_neovim_with_lsp_and_clangd/

local status, nvim_lsp = pcall(require, "lspconfig")
if (not status) then
  vim.notify("Could not initialize LSP config.", vim.log.levels.ERROR)
  return
end

local protocol = require("vim.lsp.protocol")

local on_attach = function(client, buf_nr)
  
  vim.notify("on_attach", vim.log.levels.TRACE)
  print("foo")

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

nvim_lsp.clangd.setup({
  cmd = { "clangd13" }
})

nvim_lsp.tsserver.setup {}
