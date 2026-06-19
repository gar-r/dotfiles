local K = require("core.keymaps")

vim.pack.add({
    "https://github.com/lewis6991/gitsigns.nvim",
})

require("gitsigns").setup({
    on_attach = function(buf)
        K.map("n", "]h", require("gitsigns").next_hunk, { buffer = buf, desc = "next hunk" })
        K.map("n", "[h", require("gitsigns").prev_hunk, { buffer = buf, desc = "prev hunk" })

        K.map("n", "<leader>hs", require("gitsigns").stage_hunk, { buffer = buf, desc = "stage hunk"})
        K.map("n", "<leader>hr", require("gitsigns").reset_hunk, { buffer = buf, desc = "reset hunk"})
        K.map("n", "<leader>hu", require("gitsigns").undo_stage_hunk, { buffer = buf, desc = "undo stage hunk"})
        K.map("n", "<leader>hp", require("gitsigns").preview_hunk, { buffer = buf, desc = "preview hunk"})

        K.map("n", "<leader>gb", require("gitsigns").blame_line, { buffer = buf, desc = "blame"})
        K.map("n", "<leader>gd", require("gitsigns").diffthis, { buffer = buf, desc = "diff this"})
    end,
})
