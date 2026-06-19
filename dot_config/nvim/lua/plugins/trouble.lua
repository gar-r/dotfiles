vim.pack.add({
    "https://github.com/folke/trouble.nvim",
})

require("trouble").setup({})

local K = require("core.keymaps")

K.map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "diagnostics (trouble)" })
K.map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "location list (trouble)" })
K.map("n", "<leader>xq", "<cmd>Trouble qflist toggle<CR>", { desc = "quickfix list (trouble)" })
K.map("n", "<leader>xr", "<cmd>Trouble lsp toggle focus=false<CR>", { desc = "LSP references (trouble)" })
