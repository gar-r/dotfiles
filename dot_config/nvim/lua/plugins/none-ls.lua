return {
	"nvimtools/none-ls.nvim",
	config = function()
		local n = require("null-ls")
		local b = n.builtins
		n.setup({
			sources = {
				b.formatting.stylua,
				b.completion.spell,
			},
		})
	end,
}
