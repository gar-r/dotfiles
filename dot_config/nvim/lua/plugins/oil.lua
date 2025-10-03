MiniDeps.now(function()

  MiniDeps.add({ source = "stevearc/oil.nvim" })
  local oil = require("oil")
  oil.setup({
    skip_confirm_for_simple_edits = true,
    keymaps = { -- disable some conflicting keymaps
      ["<C-h>"] = false,
      ["<C-l>"] = false,
    },
  })

  local km = require("core.keymaps")
  km.set("n", "-", oil.open, { desc = "file explorer" })
  km.set("n", "<C-->", oil.toggle_float, { desc = "floaing file explorer" })

end)
