local M = {}

function M.setup()
  require('render-markdown').setup({
    completions = { lsp = { enabled = true } },

    render_modes = { 'n' },

    anti_conceal = {
      enabled = false,
    },

    heading = {
      sign = false,
      position = 'inline',
      width = { 'full', 'full', 'block', 'block' },
      -- min_width = 80,
    },

    bullet = {
      left_pad = 2,
    },

    code = {
      position = 'left',
      width = 'block',
      right_pad = 2,
      left_pad = 2,
      language_border = ' ',
    },

    checkbox = {
      checked = { scope_highlight = '@markup.strikethrough' },
      custom = {
        moep = { raw = '[m]', rendered = 'xx ', left_pad = 2 },
      },
    },

    callout = {
      moep = { raw = '[!MOEP]', rendered = 'moep',  highlight = 'RenderMarkdownInfo', category = 'custom' },
    },

    link = {
    },

    sign = {
      enabled = false,
    },
  })
end


return M
