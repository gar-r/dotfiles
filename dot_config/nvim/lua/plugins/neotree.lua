return {
	"nvim-neo-tree/neo-tree.nvim",
    lazy = false,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	keys = {
		{
			"<leader>n",
			function()
				require("neo-tree.command").execute({ toggle = true })
			end,
			desc = "Neotree",
		},
	},
	opts = {
		close_if_last_window = true,
	},
	config = function(_, opts)
		vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
		vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
		vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
		vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })
        require("neo-tree").setup(opts)
	end,
}
