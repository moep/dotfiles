function get_default_opts(desc) 
  local description = desc and desc or "(no description)" 
  return {
    noremap = true,
    silent = true,
    desc = "[user] " .. description
  }
end

function inoremap(lhs, rhs, desc) 
  vim.keymap.set("i", lhs, rhs, get_default_opts(desc))
end

function nnoremap(lhs, rhs, desc) 
  vim.keymap.set("n", lhs, rhs, get_default_opts(desc))
end

function export_keymap() 
  local target = vim.fn.stdpath("state") .. "/keymap.txt"
  local awk_script = vim.fn.stdpath("data") .. "/keymap.awk"
  
  vim.cmd("redir! >" .. target)
  vim.cmd("silent verbose map")
  vim.cmd("redir END")
end
