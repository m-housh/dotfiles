-- Bootstrap Lazy.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  dev = {
    path = '~/LocalProjects/plugins',
    fallback = true
  },

  -- Theme --
  { import = 'user.plugin.theme' },

  -- Completions --
  { import = 'user.plugin.cmp' },

  -- Git --
  { import = 'user.plugin.lazygit' },

  -- LSP, formatting, etc. --
  { 'folke/neodev.nvim', opts = {} },
  { import = 'user.plugin.lsp' },
  { import = 'user.plugin.lualine' },
  { import = 'user.plugin.treesitter' },
  { import = 'user.plugin.formatter' },
  { import = 'user.plugin.go' },
  --{'fladson/vim-kitty', lazy=true, },

  -- Navigation --
  { import = 'user.plugin.neo-tree' },
  { import = 'user.plugin.telescope' },

  -- Utilities --
  { import = 'user.plugin.comment' },
  { import = 'user.plugin.noice' },
  { import = 'user.plugin.swift' },
  { import = 'user.plugin.toggleterm' },
  { import = 'user.plugin.which-key' },
  { import = 'user.plugin.wrapping' },
  {
    "folke/zen-mode.nvim",
    opts = { }
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "NMAC427/guess-indent.nvim",
    opts = { }
  },
  { import = 'user.plugin.todo-comments' },
  { "NoahTheDuke/vim-just", ft = { "just" } },
  {
    'chipsenkbeil/distant.nvim',
    branch = 'v0.3',
    config = function()
        require('distant'):setup()
    end
  },

})
