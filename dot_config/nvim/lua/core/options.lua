-- editor options
vim.opt.number = true
vim.opt.relativenumber = true

-- tabs
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false

-- temp files
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

-- search
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.inccommand = "split"

-- term
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- ui options
vim.opt.mouse = "a"
vim.opt.backspace = { "start", "eol", "indent" }
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.colorcolumn = "120"

-- misc
vim.opt.clipboard:append("unnamedplus")
vim.opt.timeoutlen = 500
vim.opt.ttimeoutlen = 0
vim.g.editorconfig = true
