local o = vim.opt
local keymap = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

local Terminal = require("toggleterm.terminal").Terminal
local swifttest = Terminal:new({
  cmd = "swift test",
  hidden = true,
  close_on_exit = false,
})

function _SWIFT_TEST_TOGGLE()
  swifttest:toggle()
end

keymap('n', '<C-b>', '<cmd>!swift build<CR>', default_options)
keymap('n', '<C-u>', ':lua _SWIFT_TEST_TOGGLE()<CR>', default_options)


