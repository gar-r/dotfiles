return {
    "rcarriga/nvim-notify",
    keys = {
        {
            "<leader>un",
            function()
                require("notify").dismiss({
                    silent = true,
                    pending = true
                })
            end,
            desc = "Dismiss Notifications"
        },
    },
    init = function()
        vim.notify = require("notify")
    end,
}
