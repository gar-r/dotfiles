local later, add = MiniDeps.later, MiniDeps.add

later(function()
  add({ source = "NMAC427/guess-indent.nvim" })
  require("guess-indent").setup()
end)

later(function()
  add( { source = "stevearc/conform.nvim" })
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      rust = { "rustfmt" },
      go = { "gofmt" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_format = "fallback",
    },
  })
end)
