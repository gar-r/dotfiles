return {
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        build = ":MasonUpdate",
        config = function(_, opts)
            require("mason").setup(opts)
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        opts = {
            ensure_installed = {
                "lua_ls",
                "gopls",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        keys = {
            { "<leader>xx", vim.diagnostic.open_float,           desc = "Show Diagnostics" },
            { "<leader>xl", vim.diagnostic.setloclist,           desc = "List Diagnostics" },
            { "[x",         vim.diagnostic.goto_prev,            desc = "Prev" },
            { "]x",         vim.diagnostic.goto_next,            desc = "Next" },
            { "gd",         vim.lsp.buf.definition,              desc = "Goto Definition" },
            { "gD",         vim.lsp.buf.declaration,             desc = "Goto Declaration" },
            { "gi",         vim.lsp.buf.implementation,          desc = "Goto Implementation" },
            { "gr",         vim.lsp.buf.references,              desc = "Goto References" },
            { "K",          vim.lsp.buf.hover,                   desc = "LSP: Hover" },
            { "<C-k>",      vim.lsp.buf.signature_help,          desc = "LSP: Signature" },
            { "<leader>ca", vim.lsp.buf.code_action,             desc = "Code Action" },
            { "<leader>cd", vim.lsp.buf.type_definition,         desc = "Type Definition" },
            { "<leader>cf", vim.lsp.buf.format,                  desc = "Format" },
            { "<leader>cr", vim.lsp.buf.rename,                  desc = "Rename" },
            { "<leader>wa", vim.lsp.buf.add_workspace_folder,    desc = "Add Folder" },
            { "<leader>wr", vim.lsp.buf.remove_workspace_folder, desc = "Remove Folder" },
            {
                "<leader>wl",
                function()
                    local list = vim.lsp.buf.list_workspace_folders()
                    print(vim.inspect(list))
                end,
                desc = "List Folders",
            },
        },
        config = function()
            local lsp = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lsp.lua_ls.setup({ capabilities = capabilities })
        end,
    },
}
