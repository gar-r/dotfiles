require('common')

vim.g.mapleader = " "
vim.g.maplocalleader = " "

nmap("v", "<C-j>", ":m '>+1<CR>gv=gv", "move line up")
nmap("v", "<C-k>", ":m '<-2<CR>gv=gv", "move lines up")

-- indent and remain in visual mode
nmap("v", "<", "<gv", "decrease indent")
nmap("v", ">", ">gv", "increase indent")

nmap("i", "<C-c>", "<Esc>", "exit insert mode")

nmap("n", "<C-c>", ":nohl<CR>", "clear highlight")
nmap("n", "<leader>ff", vim.lsp.buf.format, "format buffer")

-- delete single char without copying to clipboard
nmap("n", "x", '"_x')

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup("user-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- tabs
nmap("n", "<leader>to", "<cmd>tabnew<CR>")
nmap("n", "<leader>tx", "<cmd>tabclose<CR>")
nmap("n", "<leader>tn", "<cmd>tabn<CR>")
nmap("n", "<leader>tp", "<cmd>tabp<CR>")
nmap("n", "<leader>tf", "<cmd>tabnew %<CR>")

-- split
nmap("n", "<leader>sv", "<C-w>v", "split window vertically")
nmap("n", "<leader>sh", "<C-w>s", "split window horizontally")
nmap("n", "<leader>se", "<C-w>=", "equalize split window sizes")
nmap("n", "<leader>sx", "<cmd>close<CR>", "close current split")

-- file
nmap("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:p")
  vim.fn.setreg("+", filePath)
  print("file path yanked: " .. filePath)
end, "yank file path")
