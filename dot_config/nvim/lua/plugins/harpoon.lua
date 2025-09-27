return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    opts = {
        settings = {
            save_on_toggle = true,
        },
    },
    keys = function()
        local keys = {
            { "<leader>H", function() require("harpoon"):list():add() end, desc = "harpoon file" },
            { "<leader>h", function()
                    local harpoon = require("harpoon")
                    harpoon.ui:toggle_quick_menu(harpoon:list())
                end,
                desc = "harpoon quick menu",
            },
        }
    
        -- add 1..4 hotkeys
        for i = 1, 4 do
            table.insert(keys, {"<leader>" .. i, 
            function()
                require("harpoon"):list():select(i)
            end,
            desc = "harpoon to file " .. i,
            })
        end
        return keys
    end,
}
