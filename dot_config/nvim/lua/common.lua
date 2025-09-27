function nmap(mode, key, cmd, desc)
    vim.keymap.set(mode, key, cmd, {
        noremap = true,
        silent = true,
        desc = desc,
    })
end
