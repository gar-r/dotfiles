vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
    "https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({})

require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
        "ts_ls",
        "rust_analyzer",
        "gopls",
        "yamlls",
        "ols",
    },
    automatic_enable = false,
})
