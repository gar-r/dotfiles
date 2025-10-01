MiniDeps.now(function()

  MiniDeps.add({ source = "stevearc/oil.nvim" })
  local oil = require("oil")
  oil.setup({
    skip_confirm_for_simple_edits = true,
  })

  vim.keymap.set("n", "-", oil.open, { desc = "file explorer" })
  vim.keymap.set("n", "<C-->", oil.toggle_float, { desc = "floaing file explorer" })

end)
