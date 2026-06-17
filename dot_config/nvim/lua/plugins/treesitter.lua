vim.pack.add({
    "https://github.com/nvim-treesitter/nvim-treesitter",
})

require("nvim-treesitter.config").setup({
    install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
    ensure_installed = {
        "lua",
        "c",
        "cpp",
        "python",
        "javascript",
        "typescript",
        "rust",
        "go",
    },
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
})
