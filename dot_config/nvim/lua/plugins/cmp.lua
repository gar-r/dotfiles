vim.pack.add({
    "https://github.com/Saghen/blink.cmp",
    "https://github.com/rafamadriz/friendly-snippets",
})

require("blink.cmp").setup({
    keymap = {
        preset = "enter",
    },
    sources = {
        default = {
            "lsp",
            "path",
            "snippets",
            "buffer",
        },
    },
})
