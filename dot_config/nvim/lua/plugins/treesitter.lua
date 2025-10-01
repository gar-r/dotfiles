MiniDeps.later(function()

  MiniDeps.add({
    source = "nvim-treesitter/nvim-treesitter",
    checkout = "master",
    hooks = {
      post_checkout = function()
        vim.cmd("TSUpdate")
      end,
    },
  })

require("nvim-treesitter.configs").setup({
  ensure_installed = {
      "c",
      "go",
      "rust",
      "python",
      "java",
      "javascript",
      "typescript",
      "tsx",
      "lua",
      "luadoc",
      "html",
      "css",
      "json",
      "yaml",
      "xml",
      "toml",
      "query",
      "markdown",
      "markdown_inline",
      "printf",
      "regex",
      "bash",
    },
  highlight = {
    enable = true,
    disable = function(_, buf)
      local max_size = 500 * 1024 -- 500 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_size then
        return true
      end
    end,
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
  folds = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<C-space>",
      node_incremental = "<C-space>",
      scope_incremental = false,
    },
  },
})

end)
