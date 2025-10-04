MiniDeps.now(function()

  MiniDeps.add({
    source = "neovim/nvim-lspconfig",
    depends = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
  })

  require("mason").setup()
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "gopls",
    },
  })
  require("mason-tool-installer").setup({})

  -- lsp key mappings
  local km = require("core.keymaps")
  km.set("n", "grn", vim.lsp.buf.rename, { desc = "lsp: rename" })
  km.set("n", "gra", vim.lsp.buf.code_action, { desc = "lsp: code action" })
  km.set("n", "grr", vim.lsp.buf.references, { desc = "lsp: references" })
  km.set("n", "gri", vim.lsp.buf.implementation, { desc = "lsp: implementation" })
  km.set("n", "grd", vim.lsp.buf.definition, { desc = "lsp: definition" })
  km.set("n", "grD", vim.lsp.buf.declaration, { desc = "lsp: declaration" })
  km.set("n", "grt", vim.lsp.buf.type_definition, { desc = "lsp: type definition" })
end)

MiniDeps.later(function()

  -- lua vim libraries
  MiniDeps.add({ source = "folke/lazydev.nvim" })
  require("lazydev").setup({
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  })

end)
