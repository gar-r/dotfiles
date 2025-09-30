return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      background = {
        light = "latte",
        dark = "mocha",
      },
      dim_inactive = {
        enabled = true,
        percentage = 0.5,
      },
      no_italic = true,
    },
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
