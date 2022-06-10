local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
  default_hl = {
    focused = {
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('Normal', 'fg'),
    },
    unfocused = {
      fg = get_hex('ColorColumn', 'bg'),
      bg = get_hex('ColorColumn', 'fg'),
    },
  },

  components = {
    {
      text = function(buffer) return ' ' .. buffer.devicon.icon end,
      hl = {
        fg = function(buffer) return buffer.devicon.color end,
      }
    },
    {
      text = function(buffer) return buffer.unique_prefix end,
      hl = {
        fg = get_hex('Comment', 'fg'),
        style = 'bold',
      },
    },
    {
      text = function(buffer) return buffer.filename .. ' ' end,
    }
  }
})
