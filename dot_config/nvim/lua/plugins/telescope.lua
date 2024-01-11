return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
            { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recents" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Text" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({})
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
