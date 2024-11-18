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
	{ import = "user.plugin" },
	-- Plugins that don't have a configuration file.
	{
		"folke/zen-mode.nvim",
		opts = {},
	},
	{
		"christoomey/vim-tmux-navigator",
		lazy = false,
	},
	--   {
	--     "NMAC427/guess-indent.nvim",
	--     opts = { }
	--   },
	{ "NoahTheDuke/vim-just", ft = { "just" } },
	{
		"chipsenkbeil/distant.nvim",
		branch = "v0.3",
		config = function()
			require("distant"):setup()
		end,
	},

	-- LSP, formatting, etc. --
	{ "folke/neodev.nvim", opts = {} },
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
