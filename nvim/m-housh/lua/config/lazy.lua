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
		path = "~/LocalProjects/plugins",
		fallback = true,
	},
	-- Import all the plugin configs in the 'plugin' directory
	{ import = "plugins" },
	-- Plugins that don't have a configuration file.
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	{ "NoahTheDuke/vim-just", ft = { "just" } },
	{
		"chipsenkbeil/distant.nvim",
		version = "v0.*",
		event = "VeryLazy",
	},
	{
		"echasnovski/mini.ai",
		version = "*",
		config = function()
			require("mini.ai").setup({})
		end,
	},
}, {
	checker = {
		enabled = true,
		notify = false,
	},
	change_detection = {
		notify = false,
	},
})

vim.keymap.set("n", "<leader>ll", "<CMD>Lazy<CR>", { desc = "Open [L]azy" })
