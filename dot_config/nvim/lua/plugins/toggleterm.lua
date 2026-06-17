vim.pack.add({
    "https://github.com/akinsho/toggleterm.nvim",
})

require("toggleterm").setup({
    size = 13,
    direction = "horizontal",
})

vim.keymap.set("n", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })
vim.keymap.set("t", "<leader>tt", "<cmd>ToggleTerm<CR>", { desc = "toggle terminal" })
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "exit terminal mode" })
