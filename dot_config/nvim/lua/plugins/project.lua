vim.pack.add({ "https://github.com/ahmedkhalf/project.nvim" })

require("project_nvim").setup({
    detection_methods = { "pattern", "lsp" },
})

require("telescope").load_extension("projects")

local K = require("core.keymaps")

K.map("n", "<leader>fp", "<cmd>Telescope projects<CR>", { desc = "find projects" })
