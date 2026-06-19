vim.pack.add({
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({})

local B = require("telescope.builtin")
local K = require("core.keymaps")

K.map("n", "<leader>ff", B.find_files, { desc = "find files" })
K.map("n", "<leader>fw", B.grep_string, { desc = "word under cursor" })
K.map("n", "<leader>fg", B.live_grep, { desc = "grep files" })
K.map("n", "<leader>fb", B.buffers, { desc = "find buffers" })
K.map("n", "<leader>fh", B.help_tags, { desc = "find help" })
K.map("n", "<leader>fd", B.diagnostics, { desc = "diagnostics" })
K.map("n", "<leader>fs", B.lsp_document_symbols, { desc = "document symbols" })
K.map("n", "<leader>fS", B.lsp_workspace_symbols, { desc = "workspace symbols" })
K.map("n", "<leader>gc", B.git_commits, { desc = "git commits" })
K.map("n", "<leader>gs", B.git_status, { desc = "git status" })
K.map("n", "<leader>gB", B.git_branches, { desc = "git branches" })
