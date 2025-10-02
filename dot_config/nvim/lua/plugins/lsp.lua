MiniDeps.now(function()

  MiniDeps.add({
    source = "mason-org/mason-lspconfig.nvim",
    depends = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
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
