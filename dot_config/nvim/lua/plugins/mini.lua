local now, later = MiniDeps.now, MiniDeps.later

-- sets sane common opts, also sets leader key
now(function() 
  require("mini.basics").setup({ 
    mappings = { windows = true },
  })
end)

now(function() require("mini.icons").setup() end)
now(function() require("mini.completion").setup() end)

later(function() require("mini.comment").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.snippets").setup() end)
later(function() require("mini.surround").setup() end)

