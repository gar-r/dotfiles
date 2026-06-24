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
vim.keymap.set('n', '<leader>tw', MiniTrailspace.trim, { desc = 'trim trailing whitespace' })
require('mini.tabline').setup()
require('mini.sessions').setup({
    autoread = true,
    autowrite = true,
    directory = vim.fn.stdpath('data') .. '/sessions',
})

require('mini.hipatterns').setup({
    highlighters = {
        hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
        todo = { pattern = '%f[%w]()TODO%f[%W]', group = 'MiniHipatternsTodo' },
        fixme = { pattern = '%f[%w]()FIXME%f[%W]', group = 'MiniHipatternsFixme' },
        hack = { pattern = '%f[%w]()HACK%f[%W]', group = 'MiniHipatternsHack' },
        note = { pattern = '%f[%w]()NOTE%f[%W]', group = 'MiniHipatternsNote' },
    },
})
