vim.notify('hello from lua/statusline.lua', vim.log.levels.TRACE)
local M = {}

---@return string
M.status_line_active = function()
  return table.concat({
    --
    -- LEFT
    --
    '[' .. vim.api.nvim_get_mode().mode .. ']',
    -- file path
    ' %f',
    -- modified flag
    '%m',

    --
    -- MIDDLE
    --
    '%=',
    '%<',
    '%#Error#(V)(o,,,,o)(V)%*',

    --
    -- RIGHT
    --
    '%=',
    -- line:column
    '%l:%c',
    -- percentage
    ' [%p%%]'
  })
end

M.status_line_inactive = function()
  return "%f"
end

return M
