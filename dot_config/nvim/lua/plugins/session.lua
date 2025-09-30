return {
  "rmagatti/auto-session",
  lazy = false,
  opts = {
    suppressed_dirs = {
      "/",
      "~/",
      "~/projects",
      "~/Downloads",
    },
  },
  keys = {
    { "<leader>ws", "<cmd>AutoSession save<CR>",    desc = "save session" },
    { "<leader>wr", "<cmd>AutoSession restore<CR>", desc = "restore session" },
  },
}
