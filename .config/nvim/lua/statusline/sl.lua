local M = {}

local MODES = {
  ['n'] = '%#moep.mode.normal# N %*',
  ['no'] = '%#moep.mode.normal# N %*',
  ['v'] = '%#moep.mode.visual# V %*',
  ['V'] = '%#moep.mode.visual# V-L %*',
  [''] = '%#moep.mode.visual# V-B %*',
  ['s'] = '%#moep.mode.select# S %*',
  ['S'] = '%#moep.mode.select# S-L %*',
  ['i'] = '%#moep.mode.insert# I %*',
  ['ic'] = '%#moep.mode.insert# I %*',
  ['R'] = '%#moep.mode.replace# R %*',
  ['Rv'] = '%#moep.mode.replace# V-R %*',
  ['c'] = '%#moep.mode.command# : %*',
  ['cv'] = '%#moep.mode.ex# vimex %*',
  ['ce'] = '%#moep.mode.ex# ex %*',
  ['r'] = '%#moep.mode.prompt# > %*',
  ['rm'] = '%#moep.mode.prompt# m> %*',
  ['r?'] = '%#moep.mode.prompt# ?> %*',
  ['!'] = '%#moep.mode.prompt# s> %*',
  ['t'] = '%#moep.mode.prompt# t> %*',
}

--- file path relative to current dir
--- see :h filename-modifiers
--- TODO refactor to function and add colors
---@return string
---@nodiscard
local function get_file_name()
  local name = vim.fn.expand('%:.:t')
  local prefix = vim.fn.expand('%:.:h')

  if prefix == '.' then
    prefix = ''
  else
    prefix = table.concat({ '%#moep.sl.fileprefix#', prefix, '/%*' })
  end

  return prefix .. name

end

---@return string
---@nodiscard
local function get_file_status()

  local flags = {}

  if vim.bo.modified then
    table.insert(flags, '+')
  end

  if vim.bo.readonly then
    table.insert(flags, 'ro')
  end

  if table.maxn(flags) == 0 then
    return ''
  end

  return table.concat({
    '[',
    table.concat(flags, ' '),
    ']',
  })
end

local function get_file_info()
  local flags = {}

  if vim.bo.fileencoding ~= 'utf-8' and vim.bo.fileencoding ~= '' then
    table.insert(flags, vim.bo.fileencoding)
  end

  if vim.bo.fileformat ~= 'unix' then
    table.insert(flags, vim.bo.fileformat)
  end

  if vim.bo.binary then
    table.insert(flags, 'bin')
  end

  if vim.bo.bomb then
    table.insert(flags, 'bomb')
  end

  if table.maxn(flags) == 0 then
    return ''
  end

  return table.concat({
    '(',
    table.concat(flags, ' '),
    ')',
  })
end

local function get_lsp_info()
  local ret = {}

  --table.insert(ret, '%#Error#(V)(o,,,,o)(V)%*')

  local num_errors = #vim.diagnostic.get(0, { severity = 1 })
  local num_warnings = #vim.diagnostic.get(0, { severity = 2 })
  local num_infos = #vim.diagnostic.get(0, { severity = 3 })
  local num_hints = #vim.diagnostic.get(0, { severity = 4 })

  if num_errors ~= 0 then
    table.insert(ret, table.concat({'%#DiagnosticError#', num_errors, '%*'}))
  end

  if num_warnings ~= 0 then
    table.insert(ret, table.concat({'%#DiagnosticWarn#', num_warnings, '%*'}))
  end

  if num_infos ~= 0 then
    table.insert(ret, table.concat({'%#DiagnosticInfo#', num_infos, '%*'}))
  end

  if num_hints ~= 0 then
    table.insert(ret, table.concat({'%#DiagnosticHint#', num_hints, '%*'}))
  end

  return table.concat(ret, ' ')
end


---@return string
M.status_line_active = function()
  return table.concat({
    --
    -- LEFT
    --
    MODES[vim.api.nvim_get_mode().mode],
    ' ',
    get_file_name(),
    get_file_status(),
    get_file_info(),

    --
    -- MIDDLE
    --
    '%=',
    '%<',
    get_lsp_info(),

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
