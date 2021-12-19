local keymap = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}
-- local expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
keymap('n', '<Space>', '<NOP>', default_options)
vim.g.mapleader = " "

-- easier escape key mapping
keymap('i', 'jk', '<ESC>', default_options)

keymap('n', '<c-s>', ':w<CR>', default_options)
keymap('i', '<c-s>', '<ESC>:w<CR>a', default_options)

-- paste over currently selected text without yanking it
keymap("v", "p", "\"_dP", default_options)

-- buffer focus
keymap('n', '<c-j>', '<c-w>j', default_options)
keymap('n', '<c-h>', '<c-w>h', default_options)
keymap('n', '<c-k>', '<c-w>k', default_options)
keymap('n', '<c-l>', '<c-w>l', default_options)

-- Resizing panes
keymap("n", "<Left>", ":vertical resize +1<CR>", default_options)
keymap("n", "<Right>", ":vertical resize -1<CR>", default_options)
keymap("n", "<Up>", ":resize -1<CR>", default_options)
keymap("n", "<Down>", ":resize +1<CR>", default_options)

-- Move selected line / block of text in visual mode
keymap("x", "K", ":move '<-2<CR>gv-gv", default_options)
keymap("x", "J", ":move '>+1<CR>gv-gv", default_options)
