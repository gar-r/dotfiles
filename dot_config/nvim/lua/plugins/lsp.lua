return {
	{ "neovim/nvim-lspconfig" },
	{ 
		"williamboman/mason.nvim",
		cmd = "Mason",
		keys = {
			{ "<leader>um", "<cmd>Mason<cr>", desc = "Mason" },
		},
		build = ":MasonUpdate",
		config = function(_, opts)
			require("mason").setup(opts)
		end
	},
	{ "williamboman/mason-lspconfig.nvim" },
}
