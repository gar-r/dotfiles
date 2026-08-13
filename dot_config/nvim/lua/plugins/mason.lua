vim.pack.add({
    "https://github.com/mason-org/mason.nvim",
})

require("mason").setup({})

local registry = require("mason-registry")

local ensure_installed = {
    "lua-language-server",
    "clangd",
    "pyright",
    "typescript-language-server",
    "rust-analyzer",
    "gopls",
    "yaml-language-server",
    "json-lsp",
    "html-lsp",
    "css-lsp",
    "marksman",
    "ols",
}

registry.refresh(vim.schedule_wrap(function(success)
    if not success then
        return
    end
    for _, pkg_name in ipairs(ensure_installed) do
        if registry.has_package(pkg_name) then
            local pkg = registry.get_package(pkg_name)
            if not pkg:is_installed() and not pkg:is_installing() then
                pkg:install()
            end
        end
    end
end))
