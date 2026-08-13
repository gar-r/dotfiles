vim.pack.add({
    "https://github.com/nvim-lualine/lualine.nvim",
})

require("lualine").setup({
    options = {
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "|", right = "|" },
    },
})
