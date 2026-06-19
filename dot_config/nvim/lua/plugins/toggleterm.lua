vim.pack.add({
    "https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
    size = 13,
    direction = "horizontal",
})

local K = require("core.keymaps")
K.map("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })
K.map("t", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })
K.map("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
