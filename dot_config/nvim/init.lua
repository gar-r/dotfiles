require("config.core")
require("config.lazyvim")
require("lazy").setup({
	spec = "plugins",
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})
