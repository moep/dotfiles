print('hello from lua/statusline/init.lua')

-- vim.opt.statusline = '%{%(nvim_get_current_win()==#g:actual_curwin || &laststatus==3) ? v:lua.sl.status_line_active() : v:lua.sl.status_line_inactive()%}'

vim.opt.statusline = '%{%(nvim_get_current_win()==#g:actual_curwin || &laststatus==3) ? v:lua.require("statusline.sl").status_line_active() : v:lua.require("statusline.sl").status_line_inactive()%}'

