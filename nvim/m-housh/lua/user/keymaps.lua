vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set
local default_options = {noremap = true, silent = true}
local telescope = require('telescope.builtin')
local wk = require("which-key")

local wk_add = function(mode, keymaps)
  wk.add(keymaps, { mode = mode, noremap = true, silent = true })
end

local find_files = function(dir)
  return function()
    telescope.find_files({ cwd = dir, hidden = true, no_ignore = true })
  end
end

--------------------------------------------------------------------------------
-- Insert Mode
--------------------------------------------------------------------------------
-- easier escape key mapping
keymap('i', 'jk', '<ESC>', default_options)
wk_add("i", {
  { "<C-s>", "<ESC>:write<CR>a", desc = "[S]ave" }
})

--------------------------------------------------------------------------------
-- Normal Mode
--------------------------------------------------------------------------------
wk_add("n", {
  { "<Left>", ":vertical resize +1<CR>", desc = "Resize Pane Left" },
  { "<Right>", ":vertical resize -1<CR>", desc = "Resize Pane Right" },
  { "<Up>", "resize -1<CR>", desc = "Resize Pane Up" },
  { "<Down>", "resize +1<CR>", desc = "Resize Pane Down" },

  { "<leader>n", "<CMD>:noh<CR>", desc = "[N]o highlighting" },
  { "<leader>s", "<CMD>:set spell!<CR>", desc = "[S]pell check toggle" },
  { "<C-n>", "<CMD>:Neotree toggle<CR>", desc = "Toggle Neotree" },
  { "<C-s>", "<CMD>:write<CR>", desc = "[S]ave" },

  -- Git
  { "<leader>gg", ":LazyGit<CR>", desc = "Open [G]it" },
  { "<leader>gf", ":Telescope git_files<CR>", desc = "Find [G]it [F]ile" },
  { "<leader>t", ":ToggleTerm<CR>", desc = "Open [T]erminal" },

  -- Telescope keymaps
  { "<leader>ff", telescope.find_files, desc = "[F]ind [F]iles" },
  { "<leader>fg", telescope.live_grep, desc = "[F]ind [G]rep" },
  { "<leader>fb", telescope.buffers, desc = "[F]ind [B]uffers" },
  { "<leader>fh", telescope.help_tags, desc = "[F]ind [H]elp" },
  { "<leader>fd", find_files('$DOTFILES'), desc = "[F]ind [D]otfiles" },
  { "<leader>fn", find_files('$DOTFILES/nvim/m-housh'), desc = "[F]ind [N]vim file" },
  { "<leader>fs", find_files('$DOTFILES/scripts/scripts'), desc = "[F]ind [S]cript" },
  { "<leader>fz", find_files('$DOTFILES/zsh/config'), desc = "[F]ind [Z]sh config file" },
  { "<leader>z", "<CMD>:ZenMode<CR>", desc = "[Z]en Mode" },
})

--------------------------------------------------------------------------------
-- Visual Mode
--------------------------------------------------------------------------------
-- wk_add("v", {
--   { "p", "\"_dP", desc = "[P]aste" },
-- })

wk_add("x", {
  { "K", ":move '<-2<CR>gv-gv", desc = "Move selected block up" },
  { "J", ":move '>+1<CR>gv-gv", desc = "Move selected block down" },
})

-- Toggle term key maps, that get attached when terminal is opened.
function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  keymap('t', '<esc>', [[<C-\><C-n>]], opts)
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

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
