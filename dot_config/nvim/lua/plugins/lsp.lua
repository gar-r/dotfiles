local K = require("core.keymaps")

vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
    underline = true,
    update_in_insert = false,
})

K.map("n", "]d", vim.diagnostic.goto_next, { desc = "next diagnostic" })
K.map("n", "[d", vim.diagnostic.goto_prev, { desc = "prev diagnostic" })
K.map("n", "<leader>td", function()
    local vt = vim.diagnostic.config().virtual_text
    vim.diagnostic.config({ virtual_text = not vt })
end, { desc = "toggle diagnostic virtual text" })

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local buf = args.buf
        K.map("n", "gd", vim.lsp.buf.definition, { buffer = buf, desc = "go to definition"})
        K.map("n", "gD", vim.lsp.buf.declaration, { buffer = buf, desc = "go to declaration"})
        K.map("n", "gi", vim.lsp.buf.implementation, { buffer = buf, desc = "go to implementation"})
        K.map("n", "gr", vim.lsp.buf.references, { buffer = buf, desc = "show references"})
        K.map("n", "K", vim.lsp.buf.hover, { buffer = buf, desc = "hover documentation"})
        K.map("n", "<leader>bf", vim.lsp.buf.format, { buffer = buf, desc = "format buffer"})
        K.map("n", "<leader>rn", vim.lsp.buf.rename, { buffer = buf, desc = "rename symbol"})
        K.map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = buf, desc = "code action"})
        K.map("n", "<leader>ih", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = buf }), { bufnr = buf })
        end, { buffer = buf, desc = "toggle inlay hints" })

        vim.lsp.inlay_hint.enable(true, { bufnr = buf })
    end,
})

local servers = {
    lua_ls = {
        cmd = { "lua-language-server" },
        filetypes = { "lua" },
        root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
        settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" },
                },
                runtime = {
                    version = "LuaJIT",
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
            },
        },
    },
    clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp", "cuda" },
        root_markers = { "compile_commands.json", "compile_flags.txt", ".clangd", ".git" },
    },
    pyright = {
        cmd = { "pyright-langserver", "--stdio" },
        filetypes = { "python" },
        root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    },
    ts_ls = {
        cmd = { "typescript-language-server", "--stdio" },
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
    },
    rust_analyzer = {
        cmd = { "rust-analyzer" },
        filetypes = { "rust" },
        root_markers = { "Cargo.toml", "rust-project.json", ".git" },
    },
    gopls = {
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_markers = { "go.work", "go.mod", ".git" },
    },
    yaml_ls = {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose" },
        root_markers = { ".git" },
        settings = {
            yaml = {
                schemas = {
                    ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*.{yml,yaml}",
                },
            },
        },
    },
    odin_ls = {
        cmd = { "ols" },
        filetypes = { "odin" },
        root_markers = { "ols.json", "odin.json", ".git" },
    },
}

for name, config in pairs(servers) do
    vim.lsp.config(name, config)
    vim.lsp.enable(name)
end
