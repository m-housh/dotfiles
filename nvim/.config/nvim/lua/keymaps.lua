local keymap = vim.api.nvim_set_keymap
default_options = {noremap = true, silent = true}
expr_options = {noremap = true, expr = true, silent = true}

-- map the leader key
--keymap('n', '<Space>', '<NOP>', default_options)
vim.g.mapleader = ","

-- easier escape key mapping
keymap('i', 'jk', '<ESC>', default_options)

keymap('n', '<c-s>', ':w<CR>', default_options)
keymap('i', '<c-s>', '<ESC>:w<CR>a', default_options)

-- buffer focus
local opts = { noremap = true }
keymap('n', '<c-j>', '<c-w>j', default_options)
keymap('n', '<c-h>', '<c-w>h', default_options)
keymap('n', '<c-k>', '<c-w>k', default_options)
keymap('n', '<c-l>', '<c-w>l', default_options)

-- refresh config
--keymap('n', '<Leader>so', ':so $MYVIMRC<CR>', default_opts)

--keymap('n', '<C-n>', ':NvimTreeToggle<CR>', default_opts)
-- find files
--keymap('n', '<Leader>f', ':Telescope find_files<cr>', default_opts)

