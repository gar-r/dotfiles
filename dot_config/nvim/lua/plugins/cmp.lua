vim.pack.add({
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = "v1.10.2",
    },
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
