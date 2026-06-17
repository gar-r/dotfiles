vim.pack.add({
    "https://github.com/nvim-mini/mini.nvim",
})

-- mini.align - text alignment with ga/gA (visual mode or motion)
require('mini.align').setup()

-- mini.comment - comment with gc/gb
require('mini.comment').setup()

-- mini.move - move lines/selections with M-j/M-k etc (normal & visual)
require('mini.move').setup()

-- mini.pairs - auto-pair brackets, quotes, etc
require('mini.pairs').setup()

-- mini.splitjoin - split/join with gS/gJ
require('mini.splitjoin').setup()

-- mini.surround - surround with sa/sd/sr/sf
require('mini.surround').setup()

-- mini.bracketed - [d/]d, [b/]b, [f/]f, [q/]q, etc
require('mini.bracketed').setup()

-- mini.animate - smooth cursor, scroll, resize animations
require('mini.animate').setup()

-- mini.cursorword - underline word under cursor in all windows
require('mini.cursorword').setup()

-- mini.hipatterns - highlight hex colors, etc
require('mini.hipatterns').setup({
  highlighters = {
    hex_color = require('mini.hipatterns').gen_highlighter.hex_color(),
  },
})

-- mini.indentscope - visual indent guides
require('mini.indentscope').setup({
  symbol = '│',
})

-- mini.trailspace - highlight and remove trailing whitespace
require('mini.trailspace').setup()
