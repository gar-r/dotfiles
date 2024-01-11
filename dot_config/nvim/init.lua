require("config.core")
require("config.lazy")
require("lazy").setup({
	spec = "plugins",
	install = { colorscheme = { "catppuccin" } },
	checker = { enabled = true },
})
