local K = require("core.keymaps")

vim.pack.add({
    -- neo-tree
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    -- dependencies
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/nvim-tree/nvim-web-devicons",
})

-- explorer
K.map("n", "<leader>et", "<cmd>Neotree toggle<CR>", { desc = "toggle file explorer" })
K.map("n", "<leader>er", "<cmd>Neotree reveal<CR>", { desc = "reveal in explorer" })

require("neo-tree").setup({})
