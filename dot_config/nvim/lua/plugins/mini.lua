local now, later = MiniDeps.now, MiniDeps.later

-- sets sane common opts, also sets leader key
now(function()
  require("mini.basics").setup({
    mappings = { windows = true },
  })
end)
now(function() require("mini.extra").setup() end)
now(function() require("mini.icons").setup() end)
now(function() require("mini.animate").setup() end)
now(function() require("mini.starter").setup() end)
now(function() require("mini.statusline").setup() end)
now(function() require("mini.tabline").setup() end)
now(function() require("mini.notify").setup() end)
now(function() require("mini.sessions").setup() end)
now(function() require("mini.completion").setup() end)
later(function() require("mini.keymap").setup() end)
later(function()
  local snip = require("mini.snippets")
  local loader = snip.gen_loader
  snip.setup({ snippets = { loader.from_lang() } })
end)
later(function()
  local indent = require("mini.indentscope")
  indent.setup({
    symbol = "│",
    draw = {
      delay = 200,
      animation = indent.gen_animation.quadratic({
        easing = "in",
        duration = 90,
        unit = "total",
      }),
    },
}) end)
later(function() require("mini.hipatterns").setup({
  highlighters = {
    todo  = { pattern = '%f[%w]()TODO()%f[%W]',  group = 'MiniHipatternsTodo'  },
    fixme = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
    note  = { pattern = '%f[%w]()NOTE()%f[%W]',  group = 'MiniHipatternsNote'  },
    hack  = { pattern = '%f[%w]()HACK()%f[%W]',  group = 'MiniHipatternsHack'  },
  },
}) end)

later(function() require("mini.comment").setup() end)
later(function() require("mini.move").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.splitjoin").setup() end)
later(function() require("mini.surround").setup() end)
later(function() require("mini.trailspace").setup() end)

later(function() require("mini.bracketed").setup() end)
later(function() require("mini.bufremove").setup() end)

later(function() require("mini.git").setup() end)
later(function() require("mini.diff").setup() end)

later(function()
  require("mini.pick").setup()
  local p = MiniPick.builtin
  vim.keymap.set("n", "<leader>ff", p.files, { desc = "find file" })
  vim.keymap.set("n", "<leader>fg", p.grep_live, { desc = "live grep" })
  vim.keymap.set("n", "<leader>fb", p.buffers, { desc = "find buffer" })
  vim.keymap.set("n", "<leader>fh", p.help, { desc = "find help" })
end)

later(function()
  local clue = require("mini.clue")
  clue.setup({
    triggers = {
      -- leader
      { mode = "n", keys = "<leader>" },
      { mode = "x", keys = "<leader>" },
      -- completion
      { mode = "i", keys = "<C-x>" },
      -- g key
      { mode = "n", keys = "g" },
      { mode = "x", keys = "g" },
      -- marks
      { mode = "n", keys = "'" },
      { mode = "n", keys = "`" },
      { mode = "x", keys = "'" },
      { mode = "x", keys = "`" },
      -- registers
      { mode = 'n', keys = '"' },
      { mode = 'x', keys = '"' },
      { mode = 'i', keys = '<C-r>' },
      { mode = 'c', keys = '<C-r>' },
      -- window commands
      { mode = 'n', keys = '<C-w>' },
      -- z key
      { mode = 'n', keys = 'z' },
      { mode = 'x', keys = 'z' },
    },
    clues = {
      -- set custom descriptions
      -- clue.set_mapping_desc("n", "lhs", "desc")
      clue.gen_clues.builtin_completion(),
      clue.gen_clues.g(),
      clue.gen_clues.marks(),
      clue.gen_clues.registers(),
      clue.gen_clues.windows(),
      clue.gen_clues.z(),
    }
  })
end)


