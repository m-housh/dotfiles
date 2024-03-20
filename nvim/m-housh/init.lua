-- Leader needs to be set before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "

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

-- Auto commands
require('user.autocmd')

-- Plugins
require('user.plugins')

-- Key maps
require('user.mappings')

-- Theme (must stay after plugins are loaded)
require('user.theme')

-- Common settings
require('user.settings')

vim.o.shiftwidth = 2

