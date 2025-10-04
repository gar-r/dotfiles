local later, add = MiniDeps.later, MiniDeps.add

later(function()
  add({ source = "NMAC427/guess-indent.nvim" })
  require("guess-indent").setup()
end)
