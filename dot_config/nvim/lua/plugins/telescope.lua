vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({})

local B = require("telescope.builtin")
local M = require("core.keymaps")

M.set("n", "<leader>ff", B.find_files, { desc = "find files" })
M.set("n", "<leader>fg", B.live_grep, { desc = "grep files" })
M.set("n", "<leader>fb", B.buffers, { desc = "find buffers" })
M.set("n", "<leader>fh", B.help_tags, { desc = "find help" })
