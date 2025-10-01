local now, later = MiniDeps.now, MiniDeps.later

-- sets sane common opts, also sets leader key
now(function() 
  require("mini.basics").setup({ 
    mappings = { windows = true },
  })
end)

later(function() require("mini.comment").setup() end)
later(function() require("mini.pairs").setup() end)
later(function() require("mini.surround").setup() end)

