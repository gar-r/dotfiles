local surround_mappings = {
  add = "gsa",
  delete = "gsd",
  find = "gsf",
  find_left = "gsF",
  highlight = "gsh",
  replace = "gsr",
  update_n_lines = "gsn",
}

return {
  { "nvim-mini/mini.nvim",       version = "*" },
  { "nvim-mini/mini.statusline", version = "*", config = true },
  { "nvim-mini/mini.comment",    version = "*" },
  {
    "nvim-mini/mini.surround",
    version = "*",
    keys = {
      { surround_mappings.add,            desc = "Add Surrounding",                     mode = { "n", "v" } },
      { surround_mappings.delete,         desc = "Delete Surrounding" },
      { surround_mappings.find,           desc = "Find Right Surrounding" },
      { surround_mappings.find_left,      desc = "Find Left Surrounding" },
      { surround_mappings.highlight,      desc = "Highlight Surrounding" },
      { surround_mappings.replace,        desc = "Replace Surrounding" },
      { surround_mappings.update_n_lines, desc = "Update `MiniSurround.config.n_lines`" },
    },
    opts = {
      mappings = surround_mappings,
    },
  },
  {
    'nvim-mini/mini.trailspace',
    version = '*',
    config = true,
    keys = {
      {
        "<leader>cw",
        function()
          require("mini.trailspace").trim()
        end,
        desc = "clear trailing whitespace",
        mode = "n"
      },
    },
  },
  {
    "nvim-mini/mini.splitjoin",
    version = "*",
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
