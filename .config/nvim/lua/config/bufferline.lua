require("bufferline").setup{
  options = {
    numbers = "none",
    indicator_icon = '',
    modified_icon = '',
    max_length = 15,
    max_prefix_length = 12,
    tab_size = 10,
    show_buffer_close_icons = false,
    show_close_icon = false,
    separator_style = {'', ''},

    offsets = {
      { 
        filetype = "NvimTree", 
        text = "File Explorer",
        text_align = "center",
      },
    },
  },
}
