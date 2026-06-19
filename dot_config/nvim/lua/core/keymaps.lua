vim.g.mapleader = " "
vim.g.maplocalleader = " "

local K = {}

local default_keymap_opts = {
    noremap = true,
    silent = true,
}

function K.map(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", default_keymap_opts, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- indent while keeping visual selection
K.map("v", "<", "<gv", { desc = "decrease indent" })
K.map("v", ">", ">gv", { desc = "increase indent" })

-- keep search result centered
K.map("n", "n", "nzzzv")
K.map("n", "N", "Nzzzv")

-- delete char without copying to clipboard
K.map("n", "x", '"_x')

K.map("n", "<C-c>", ":nohl<CR>", { desc = "clear search highlight" })

-- split
K.map("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
K.map("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
K.map("n", "<leader>se", "<C-w>=", { desc = "split equalize" })
K.map("n", "<leader>sx", "<cmd>close<CR>", { desc = "split close" })

-- tabs
K.map("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
K.map("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
K.map("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
K.map("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "prev tab" })

return K
