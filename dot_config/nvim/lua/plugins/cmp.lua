vim.pack.add({
    {
        src = "https://github.com/Saghen/blink.cmp",
        version = "v1.10.2",
    },
})

require("blink.cmp").setup({
    keymap = {
        preset = "enter",
    },
    snippets = {
        preset = "luasnip",
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
