return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"diff",
				"go",
				"html",
				"javascript",
				"json",
				"lua",
				"luadoc",
				"luap",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			},
			auto_install = true,
			highlight = { enabled = true },
			indent = { enabled = true },
		},
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end
	},
}
