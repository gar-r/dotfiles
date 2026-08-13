vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter").install({
    "lua",
    "c",
    "cpp",
    "python",
    "javascript",
    "typescript",
    "rust",
    "go",
    "html",
    "css",
    "json",
    "yaml",
    "markdown",
    "odin",
}, { summary = true })
