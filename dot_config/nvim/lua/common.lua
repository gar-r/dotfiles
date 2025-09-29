function nmap(mode, key, cmd, desc, buffer)
    vim.keymap.set(mode, key, cmd, {
        noremap = true,
        silent = true,
        desc = desc,
        buffer = buffer,
    })
end
