vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({})

local B = require("telescope.builtin")
local K = require("core.keymaps")

K.map("n", "<leader>ff", B.find_files, { desc = "find files" })
K.map("n", "<leader>fg", B.live_grep, { desc = "grep files" })
K.map("n", "<leader>fb", B.buffers, { desc = "find buffers" })
K.map("n", "<leader>fh", B.help_tags, { desc = "find help" })
