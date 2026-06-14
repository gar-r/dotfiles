vim.pack.add({{ 
    name = "catppuccin",
    src = "https://github.com/catppuccin/nvim", 
}})

require("catppuccin").setup({
    flavour = "mocha",
    no_italic = true,
})

vim.cmd.colorscheme "catppuccin-nvim"
