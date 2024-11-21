return {
	"m-housh/swift.nvim",
	dependencies = {
		"akinsho/toggleterm.nvim",
	},
	ft = { "swift" },
	config = function()
		require("swift").setup()
		local default_options = { noremap = true, silent = true }
		local actions = require("swift.actions")
		vim.opt.tabstop = 2
		vim.opt.shiftwidth = 2
		vim.keymap.set("n", "<C-b>", actions.build, default_options)
		vim.keymap.set("n", "<C-S-U>", actions.test, default_options)
	end,
}
