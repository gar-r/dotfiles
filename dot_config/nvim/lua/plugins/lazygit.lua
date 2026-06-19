local K = require("core.keymaps")

K.map("n", "<leader>gg", function()
    local Terminal = require("toggleterm.terminal").Terminal
    local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        float_opts = { border = "rounded" },
    })
    lazygit:toggle()
end, { desc = "lazygit" })
