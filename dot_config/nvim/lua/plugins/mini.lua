return {
  { "nvim-mini/mini.nvim",       version = false },
  { "nvim-mini/mini.statusline", version = false, config = true },
  { "nvim-mini/mini.comment",    version = false, config = true },
  { 'nvim-mini/mini.pairs',      version = false, config = true },
  {
    "nvim-mini/mini.surround",
    version = false,
    opts = {
      mappings = {
        add = "gsa",
        delete = "gsd",
        find = "gsf",
        find_left = "gsF",
        highlight = "gsh",
        replace = "gsr",
        update_n_lines = "gsn",
      }
    },
  },
  {
    'nvim-mini/mini.trailspace',
    version = false,
    config = true,
    keys = {
      { "<leader>cw", function() require("mini.trailspace").trim() end, desc = "clear trailing whitespace", mode = "n" },
    },
  },
  {
    "nvim-mini/mini.splitjoin",
    version = false,
    opts = {
      mappings = {
        toggle = "gS"
      },
    },
    keys = {
      { "gS", desc = "toggle mini split/join" },
    },
  },
}
