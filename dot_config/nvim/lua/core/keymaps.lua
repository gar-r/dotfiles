vim.g.mapleader = " "
vim.g.maplocalleader = " "

local M = {}

local default_keymap_opts = {
  noremap = true,
  silent = true,
}

function M.set(mode, lhs, rhs, opts)
  opts = vim.tbl_extend("force", default_keymap_opts, opts or {})
  vim.keymap.set(mode, lhs, rhs, opts)
end

return M
