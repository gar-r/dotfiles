vim.g.mapleader = " "
vim.g.maplocalleader = " "

local M = {}

local default_keymap_opts = {
    noremap = true,
    silent = true,
}

function M.set(mode, lhs, rhs, opts)
    opts = vim.tbl_extend("force", default_keymap_opts, opts or {})
    vim.keymap.set(mode, lhs, rhs, opts)
end

-- move selected lines in visual mode
M.set("v", "<C-S-Up>", ":m '<-2<CR>gv=gv", { desc = "move lines down" })
M.set("v", "<C-S-Down>", ":m '>+1<CR>gv=gv", { desc = "move lines up" })

-- indent while keeping visual selection
M.set("v", "<", "<gv", { desc = "decrease indent" })
M.set("v", ">", ">gv", { desc = "increase indent" })

-- keep search result centered
M.set("n", "n", "nzzzv")
M.set("n", "N", "Nzzzv")

-- delete char without copying to clipboard
M.set("n", "x", '"_x')

M.set("n", "<C-c>", ":nohl<CR>", { desc = "clear search highlight" })

-- split
M.set("n", "<leader>sv", "<C-w>v", { desc = "split window vertically" })
M.set("n", "<leader>sh", "<C-w>s", { desc = "split window horizontally" })
M.set("n", "<leader>se", "<C-w>=", { desc = "split equalize" })
M.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "split close" })

-- tabs
M.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "open new tab" })
M.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "close current tab" })
M.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "next tab" })
M.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "prev tab" })


return M
