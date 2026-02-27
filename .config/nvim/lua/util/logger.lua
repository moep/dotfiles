local M = {}

-- TODO add custom hl groups
---@type { [vim.log.levels]: string }
local highlight_groups_for_log_level = {
  [vim.log.levels.TRACE] = 'Comment',
  [vim.log.levels.DEBUG] = 'DiagnosticOk',
  [vim.log.levels.INFO] = 'Fg',
  [vim.log.levels.WARN] = 'DiagnosticWarn',
  [vim.log.levels.ERROR] = 'DiagnosticError',
}


---@param level vim.log.levels
---@param subtag string?
---@param message string
local function log(level, message, subtag)
  local log_level
  if vim.g.moepconf == nil or vim.g.moepconf.loglevel == nil then
     log_level = vim.log.levels.TRACE
  else
     log_level = vim.g.moepconf.loglevel
  end

  if level < log_level then
    return
  end

  vim.api.nvim_echo({
    {'moepconf', 'DiagnosticHint'},
    {subtag and ':' .. subtag or '', 'MoreMsg'},
    {' ' },
    {'' .. message, highlight_groups_for_log_level[level]},
  }, true, {})

end

---@param message string
---@param subtag string?
function M.trace(message, subtag)
  log(vim.log.levels.TRACE, message, subtag)
end

---@param message string
---@param subtag string?
function M.debug(message, subtag)
  log(vim.log.levels.DEBUG, message, subtag)
end


---@param message string
---@param subtag string?
function M.info(message, subtag)
  log(vim.log.levels.INFO, message, subtag)
end

---@param message string
---@param subtag string?
function M.warn(message, subtag)
  log(vim.log.levels.WARN, message, subtag)
end

---@param message string
---@param subtag string?
function M.error(message, subtag)
  log(vim.log.levels.ERROR, message, subtag)
end

return M
