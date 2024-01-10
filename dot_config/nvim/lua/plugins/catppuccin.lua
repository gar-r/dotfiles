return {
	-- catppuccin theme
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function(_, opts)
			opts.flavour = "mocha"
			opts.no_italic = true
			vim.cmd.colorscheme "catppuccin"
		end,
	},
}
