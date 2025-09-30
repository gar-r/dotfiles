require("common")

return {
  { "tpope/vim-fugitive" },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(buf)
        local gs = package.loaded.gitsigns

        -- stage
        nmap("n", "<leader>ghS", gs.stage_buffer, "stage buffer", buf)
        nmap({ "n", "v" }, "<leader>ghs", gs.stage_hunk, "stage hunk", buf)
        nmap("n", "<leader>ghu", gs.undo_stage_hunk, "undo stage hunk", buf)
        nmap("n", "<leader>ghp", gs.preview_hunk_inline, "preview hunk inline", buf)

        -- reset
        nmap("n", "<leader>ghR", gs.reset_buffer, "reset buffer", buf)
        nmap({ "n", "v" }, "<leader>ghr", gs.reset_hunk, "reset hunk", buf)

        -- blame, diff
        nmap("n", "<leader>ghl", gs.toggle_current_line_blame, "toggle line blame", buf)
        nmap("n", "<leader>ghB", function() gs.blame() end, "blame buffer", buf)
        nmap("n", "<leader>ghb", function() gs.blame_line({ full = true }) end, "blame line", buf)
        nmap("n", "<leader>ghd", gs.diffthis, "diff this", buf)
        nmap("n", "<leader>ghD", function() gs.diffthis("~") end, "diff this ~", buf)

        -- nav
        nmap("n", "]h", gs.next_hunk, "next hunk")
        nmap("n", "[h", gs.prev_hunk, "prev hunk")
        nmap({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", "select hunk")
      end,
    },
  },
}
