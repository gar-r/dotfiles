return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local b = require('telescope.builtin')
		vim.keymap.set("n", "<leader>ff", b.find_files, {})
		vim.keymap.set("n", "<leader>fg", b.live_grep, {})
		vim.keymap.set("n", "<leader>fb", b.buffers, {})
		vim.keymap.set("n", "<leader>fh", b.help_tags, {})
	end,
}
