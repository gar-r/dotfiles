require("config.core")
require("config.bootstrap")
require("lazy").setup({
	spec = "plugins",
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})
