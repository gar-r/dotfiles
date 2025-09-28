return {
    "nvim-treesitter/nvim-treesitter", 
    lazy = false, 
    branch = "main",
    version = false,
    build = function()
        require("nvim-treesitter").update(nil, {summary = true})        
    end,
    opts_extend = { "ensure_installed" },
    opts = {
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
        auto_install = true,
        highlight = {
            enable = true,
            disable = function()
                local max_size = 500 * 1024    -- 500 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_size then
                    return true
                end
            end,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        folds = { enable = true },
        incremental_selection = { enable = true }, 
    },
    config = function(_, opts)
        require("nvim-treesitter").setup(opts)
    end,
}
