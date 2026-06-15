local M = require("core.keymaps")

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

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local function map(mode, lhs, rhs, desc)
            M.set(mode, lhs, rhs, { buffer = args.buf, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "go to declaration")
        map("n", "gi", vim.lsp.buf.implementation, "go to implementation")
        map("n", "gr", vim.lsp.buf.references, "show references")
        map("n", "K", vim.lsp.buf.hover, "hover documentation")
        map("n", "<leader>bf", vim.lsp.buf.format, "format buffer")
        map("n", "<leader>rn", vim.lsp.buf.rename, "rename symbol")
        map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, "code action")
        map("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end, "previous diagnostic")
        map("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end, "next diagnostic")
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
}

for name, config in pairs(servers) do
    if vim.fn.executable(config.cmd[1]) == 1 then
        vim.lsp.config(name, config)
        vim.lsp.enable(name)
    end
end
