return {
	-- highlight nearby matching words
	{ "RRethy/vim-illuminate" },
	-- improve vim input and select boxes
	{ "stevearc/dressing.nvim" },
	-- add indent guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			scope = { enabled = false },
			exclude = {
				filetypes = {
					"help",
					"neo-tree",
					"mason",
					"notify",
					"toggleterm",
				},
			},
		},
	},
}
