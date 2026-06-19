vim.pack.add({ "https://github.com/stevearc/aerial.nvim" })

require("aerial").setup({
    attach_mode = "global",
    backends = { "treesitter", "lsp", "markdown" },
    show_guides = true,
})

local K = require("core.keymaps")

K.map("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "toggle symbols outline" })
K.map("n", "]a", "<cmd>AerialNext<CR>", { desc = "next symbol" })
K.map("n", "[a", "<cmd>AerialPrev<CR>", { desc = "prev symbol" })
