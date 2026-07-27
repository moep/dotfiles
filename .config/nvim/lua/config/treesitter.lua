local log = require('util.logger')
local function log_d(message)
  log.debug(message, 'ts')
end

require('nvim-treesitter').install({
  'awk',
  'bash',
  'beancount',
  'c',
  'caddy',
  'cmake',
  --'comment',
  'cpp',
  'css',
  'csv',
  'desktop',
  'diff',
  'dockerfile',
  'dot',
  'dtd',
  'ecma',
  'fish',
  'forth',
  'git_config',
  'git_rebase',
  'gitattributes',
  'gitcommit',
  'gitignore',
  'go',
  'gpg',
  'graphql',
  'groovy',
  'haskell',
  'haskell_persistent',
  'helm',
  'html',
  'html_tags',
  'hyprlang',
  'ini',
  'java',
  'javadoc',
  'javascript',
  'jinja',
  'jinja_inline',
  'jq',
  'jsdoc',
  'json',
  'json5',
  'jsx',
  'kitty',
  'llvm',
  'lua',
  'luadoc',
  'luap',
  'luau',
  'make',
  'markdown',
  'markdown_inline',
  'mermaid',
  'meson',
  'nginx',
  'ninja',
  'passwd',
  'pem',
  'perl',
  'pod',
  'powershell',
  'printf',
  'python',
  'readline',
  'regex',
  'robots_txt',
  'rust',
  'scss',
  'sql',
  'ssh_config',
  'tmux',
  -- 'todotxt',
  'toml',
  'tsx',
  'typescript',
  'typespec',
  'typst',
  'vim',
  'yaml',
})

local group = vim.api.nvim_create_augroup('moepconf.treesitter', { clear = true })
vim.api.nvim_create_autocmd('FileType', {
  group = group,
  -- TODO read from moepconf
  pattern = { 'markdown', 'lua' },
  callback = function(event)
    log_d('Starting treesitter for buffer ' .. event.buf)
    local success, _ = pcall(vim.treesitter.start, event.buf)

    if (success) then
      vim.wo.foldmethod = 'expr'
      -- TODO evaluate lsp.foldexpr() vs treesitter.foldexpr()
      vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
    end

  end
})

-- vim.treesitter.language.add('lua', { path = '/path/to/lua.so' })
-- vim.treesitter.language.register('lua', { 'lua' })

-- TODO replace hardcoded path with runtimepath
-- TODO enable via vim.g.moepconf?
-- vim.treesitter.language.add('bash', { path = 'bash.so' })
-- vim.treesitter.language.register('bash', {'bash'})
