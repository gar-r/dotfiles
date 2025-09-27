return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        animate = { enabled = true },
        dim = { enabled = true },
        explorer = {
            enabled = true,
            layout = { cycle = false },
        },
        quickfile = { enabled = true },
        indent = { enabled = true },
        notify = { enabled = true },
        dashboard = {
            sections = {
                { section = "header"},
                { section = "projects", icon = " ", title = "Projects", indent = 2, padding  = 2 },
                { section = "recent_files", icon = " ", title = "Recent Files", indent = 2, padding = 2},
                { section = "startup" },
            }
        },
        picker = { 
            enabled = true,
            matchers = {
                cwd_bonus = true,
                frecency = true,
            },
            formatters = {
                file = { filename_first = true }
            },
            layout = {
                preset = "telescope",
                cycle = false,
            },
        },
        terminal = { 
            enabled = true,
            win = {
                height = 0.25,
            },
        },
    },
    keys = {
        { "<C-`>", function() Snacks.terminal.toggle() end, desc = "toggle terminal" },
        { "<leader>ft", function() Snacks.explorer() end, desc = "file explorer" },
        { "<leader>ff", function() Snacks.picker.smart() end, desc = "find files" },
        { "<leader>sf", function() Snacks.picker.files() end, desc = "search files" },
        { "<leader>sw", function() Snacks.picker.grep() end, desc = "search word" },
        { "<leader>sW", function() Snacks.picker.grep_word() end, desc = "search visual selection" },
        { "<leader>sc", function() Snacks.picker.command_history({layout = "vscode"}) end, desc = "search command history" },
        { "<leader>sk", function() Snacks.picker.keymaps({layout = "vscode"}) end, desc = "search keymaps" },
        { "<leader>sh", function() Snacks.picker.help({layout = "ivy"}) end, desc = "search help pages" },
        { "<leader>sn", function() Snacks.picker.notifications({layout = "vscode"}) end, desc = "notification history"},
        { "<leader>gg", function() Snacks.lazygit() end, desc = "open lazygit" },
        { "<leader>gl", function() Snacks.lazygit.log() end, desc = "open lazygit log" },
        { "<leader>gb", function() Snacks.picker.git_branches({layout = "select"}) end, desc = "pick git branches" },
    },
}
