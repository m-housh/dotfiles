local o = vim.opt
local keymap = vim.api.nvim_set_keymap
local default_options = {noremap = true, silent = true}
local Terminal = require("toggleterm.terminal").Terminal
local autocmd = vim.api.nvim_create_autocmd

o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

function SWIFT_TEST()
  local swifttest = Terminal:new({
    cmd = "swift test",
    hidden = true,
    close_on_exit = false,
    auto_scroll = true,
  })
  swifttest:toggle()
end

function SWIFT_BUILD()
  local swiftbuild = Terminal:new({
    cmd = "swift build",
    hidden = true,
    close_on_exit = false,
    auto_scroll = true,
  })
  swiftbuild:toggle()
end

-- Key map <control>-b to build swift package in terminal window.
keymap('n', '<C-b>', '<cmd>lua SWIFT_BUILD()<cr>', default_options)

-- Key map <control>-b to build swift package in terminal window.
keymap('n', '<C-u>', '<cmd>lua SWIFT_TEST()<cr>', default_options)

-- Format swift files when buffer is written
autocmd(
  "BufWritePost",
  {
    pattern = { "*.swift" },
    command=":silent exec '!swift-format --in-place %'"
  }
)
