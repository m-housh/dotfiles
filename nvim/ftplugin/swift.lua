local o = vim.opt
local keymap = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

keymap('n', '<C-b>', '<cmd>!swift build<CR>', default_options)
keymap('n', '<C-T>', '<cmd>!swift test<CR>', default_options)

