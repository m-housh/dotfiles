local keymap = vim.keymap.set
local default_options = {noremap = true, silent = true}
local telescope = require('telescope.builtin')
-- local expr_options = {noremap = true, expr = true, silent = true}
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Toggle neo-tree open or closed
keymap("n", "<c-n>", "<CMD>:Neotree toggle<CR>", default_options)

-- Toggle Lazy Git
keymap("n", '<leader>gg', ':LazyGit<CR>', default_options)
keymap("n", "<leader>gf", ":Telescope git_files<CR>", default_options)
keymap("n", "<leader>t", ":ToggleTerm<CR>", default_options)

-- Zen Mode Toggle
keymap('n', '<leader>z', "<cmd>:ZenMode<CR>", default_options)

-- Toggle term key maps, that get attached when terminal is opened.
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

-- Formatting
keymap('n', '<leader>f', '<cmd>:Format<CR>', default_options)
keymap('n', '<leader>F', '<cmd>:FormatWrite<CR>', default_options)

-- Finds

-- Find espanso config files.
keymap('n', '<leader>fn', function()
  telescope.find_files({
    cwd='$HOME/.dotfiles/espanso/espanso'
  })
end, default_options)

-- Find nvim config files.
keymap('n', '<leader>fn', function()
  telescope.find_files({
    cwd='$HOME/.dotfiles/nvim/m-housh'
  })
end, default_options)

-- Find script files.
keymap('n', '<leader>fs', function()
  telescope.find_files({
    cwd='$HOME/.dotfiles/scripts/scripts'
  })
end, default_options)

--   Find zsh config files.
keymap('n', '<leader>fz', function()
  telescope.find_files({
    cwd='$HOME/.dotfiles/zsh/config'
  })
end, default_options)

-- Turn off highlighting after search.
keymap('n', '<leader>n', '<cmd>:noh<cr>', default_options)

-- Toggle Spell Checking.
keymap('n', '<leader>s', '<cmd>:set spell!<cr>', default_options)

-- LuaSnip Keymaps
--local ls = require('luasnip')

-- <c-k> to expand snippets.
-- This will expand the snippet or jump to the next item within the snippet.
-- vim.keymap.set({ "i", "s" }, "<c-k>", function()
--   if ls.expand_or_jumpable() then
--     ls.expand_or_jump()
--   end
-- end, { silent = true })


-- <c-j>
-- This will jump backwards in the snippet.
-- vim.keymap.set({ "i", "s" }, "<c-j>", function()
--   if ls.jumpable(-1) then
--     ls.jump(-1)
--   end
-- end, { silent = true })

-- <c-l>
-- This is for selecting withing a list of options.
-- vim.keymap.set("i", "<c-l>", function()
--   if ls.choice_active() then
--     ls.change_choice(1)
--   end
-- end, { silent = true })

-- Reload the snippets.
--vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/m-housh/lua/snippets/init.lua<cr>")
