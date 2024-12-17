print("jamiebarrow")

-- lazy.nvim
require('config.lazy')


-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Spacing
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2

-- Show special characters
vim.opt.list = true
vim.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Paste/put from system clipboard
vim.opt.clipboard = "unnamedplus"

-- Allow executing of whole file or selected line in a saved lua file.
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")


-- Highlight when yanking (copying) text.
--  Try it with `yap` in normal mode.
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})
