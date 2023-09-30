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

  -- LSP --
  { 'folke/neodev.nvim', opts = {} },
  { import = 'user.plugin.lsp' },
  { import = 'user.plugin.lualine' },


  { import = 'user.plugin.swift' },

  { import = 'user.plugin.neo-tree' },
  { import = 'user.plugin.overseer' },
  { import = 'user.plugin.telescope' },
  { import = 'user.plugin.treesitter' },

  -- Git --
  --{ import = 'user.plugin.diffview' },
  { import = 'user.plugin.lazygit' },
  --{ import = 'user.plugin.neogit' },


  -- Utilities --
  { import = 'user.plugin.toggleterm' },
  { import = 'user.plugin.which-key' },
  { import = 'user.plugin.wrapping' },

})
