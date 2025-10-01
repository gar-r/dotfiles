MiniDeps.now(function()

  MiniDeps.add({
    source = "catppuccin/nvim",
    name = "catppuccin",
  })

  require("catppuccin").setup({
    dim_inactive = {
      enaled = true,
      percentage = 0.5,
    },
    no_italic = true,
  })

  vim.cmd([[colorscheme catppuccin]])

end)
