local ScratchTerm = {
  term_buf = -1,
  term_win = -1,
  opts = {
    height = 10,
  },
}

function ScratchTerm:toggle()
  if not self:is_open() then
    self:open()
    vim.cmd(":startinsert")
  else
    self:close()
  end
end

function ScratchTerm:is_open()
  return vim.api.nvim_win_is_valid(self.term_win)
end

function ScratchTerm:open()
  self:ensure_buf()
  self.term_win = vim.api.nvim_open_win(self.term_buf, true, {
    split = "below",
    height = self.opts.height,
  })
  if vim.bo[self.term_buf].buftype ~= "terminal" then
    vim.cmd.term()
  end
end

function ScratchTerm:close()
  vim.api.nvim_win_close(self.term_win, true)
end

function ScratchTerm:ensure_buf()
  if not vim.api.nvim_buf_is_valid(self.term_buf) then
    self.term_buf = vim.api.nvim_create_buf(false, true)
  end
end

vim.api.nvim_create_user_command("ScratchTerm", function()
  ScratchTerm:toggle()
end, {})


local km = require("core.keymaps")

-- map double esc to return to normal mode
km.set("t", "<esc><esc>", "<C-\\><C-n>")
km.set({"n", "t"}, "<C-`>", function()
  ScratchTerm:toggle()
end, { desc = "toggle terminal" })
