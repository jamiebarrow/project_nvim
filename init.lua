print("jamiebarrow")

-- lazy.nvim
require('config.lazy')


-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Spacing
vim.opt.shiftwidth = 2

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

-- QuickFix keybindings
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")
vim.keymap.set("n", "<M-l>", "<cmd>copen<CR>")
vim.keymap.set("n", "<M-h>", "<cmd>cclose<CR>")
vim.keymap.set("n", "<Esc>", "<cmd>cclose<CR>")

-- These are in nightly, but not yet current version
vim.keymap.set('n', 'grn', vim.lsp.buf.rename)
vim.keymap.set('n', 'gra', vim.lsp.buf.code_action)
vim.keymap.set('n', 'grr', vim.lsp.buf.references)
vim.keymap.set('i', '<C-s>', vim.lsp.buf.signature_help)

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

-- Customize vim terminal
vim.api.nvim_create_autocmd('TermOpen', {
  group = vim.api.nvim_create_augroup('jamiebarrow-term-open', { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end
})

vim.keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 5)
end)
