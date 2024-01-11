return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
        no_italic = true,
        integrations = {
            mason = true,
            notify = true,
            telescope = true,
            treesitter = true,
            treesitter_context = true,
        },
    },
    config = function()
        vim.cmd.colorscheme "catppuccin"
    end,
}
