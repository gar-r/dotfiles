vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
})

require('mini.align').setup()
require('mini.comment').setup()
require('mini.move').setup()
require('mini.pairs').setup()
require('mini.splitjoin').setup()
require('mini.surround').setup()
require('mini.bracketed').setup()
require('mini.animate').setup()
require('mini.indentscope').setup({ symbol = '│' })
require('mini.trailspace').setup()
