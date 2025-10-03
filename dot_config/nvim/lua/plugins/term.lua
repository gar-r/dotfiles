local ScratchTerm = {
  term_buf = nil,
  term_win = nil,
  opts = {
    height = 10,
  },
}

function ScratchTerm:ensure_buf()
  if not self.term_buf or not vim.api.nvim_buf_is_valid(self.term_buf) then
    vim.cmd("botright new")
    vim.cmd("terminal")
    self.term_buf = vim.api.nvim_get_current_buf()
    self.term_win = nil
    vim.api.nvim_win_close(0, true)
  end
end

function ScratchTerm:toggle()
  if self.term_win and vim.api.nvim_win_is_valid(self.term_win) then
    -- Terminal is open → close it
    self.term_height = vim.api.nvim_win_get_height(self.term_win)
    vim.api.nvim_win_close(self.term_win, true)
    self.term_win = nil
  else
    self:ensure_buf()
    local h = self.term_height or self.opts.height
    vim.cmd("botright " .. h .. "split")
    self.term_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(self.term_win, self.term_buf)
    vim.cmd("startinsert")
  end
end

-- normal mode toggle
vim.keymap.set("n", "<C-`>", function()
  ScratchTerm:toggle()
end, { desc = "toggle quick terminal" })

-- terminal mode toggle (exit insert mode first)
vim.keymap.set("t", "<C-`>", function()
  vim.cmd("stopinsert")
  ScratchTerm:toggle()
end, { desc = "toggle quick terminal" })

