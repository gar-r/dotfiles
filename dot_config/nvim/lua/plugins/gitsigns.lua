local K = require("core.keymaps")

vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

local gs = require("gitsigns")
gs.setup({
    on_attach = function(buf)
        K.map("n", "]h", gs.next_hunk, { buffer = buf, desc = "next hunk" })
        K.map("n", "[h", gs.prev_hunk, { buffer = buf, desc = "prev hunk" })

        K.map("n", "<leader>hs", gs.stage_hunk, { buffer = buf, desc = "stage hunk"})
        K.map("n", "<leader>hr", gs.reset_hunk, { buffer = buf, desc = "reset hunk"})
        K.map("n", "<leader>hu", gs.undo_stage_hunk, { buffer = buf, desc = "undo stage hunk"})
        K.map("n", "<leader>hp", gs.preview_hunk, { buffer = buf, desc = "preview hunk"})

        K.map("n", "<leader>gb", gs.blame_line, { buffer = buf, desc = "blame"})
        K.map("n", "<leader>gd", gs.diffthis, { buffer = buf, desc = "diff this"})
    end,
})
