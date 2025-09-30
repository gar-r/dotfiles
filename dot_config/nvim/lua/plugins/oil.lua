require('common')

return {
  'stevearc/oil.nvim',
  config = function()
    local oil = require("oil")

    oil.setup({
      keymaps = {
        ["q"] = "actions.close",
      },
      skip_confirm_for_simple_edits = true,
      float = {
        max_width = 0.4,
        max_height = 0.4,
        border = "single",
      },
    })

    -- line highlight
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.cursorline = true
      end
    })

    -- keymaps
    nmap("n", "-", "<CMD>Oil<CR>", "open file explorer")
    nmap("n", "<leader>fe", oil.toggle_float, "toggle floating file explorer")
  end,
  dependencies = {
    { "echasnovski/mini.icons", opts = {} },
  },
  lazy = false,
}
