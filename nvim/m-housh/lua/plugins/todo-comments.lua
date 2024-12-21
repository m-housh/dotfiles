return {
	"folke/todo-comments.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"folke/trouble.nvim",
	},
	opts = {
		keywords = {
			-- Adds the important keyword, I primarily use this in markdown
			-- documents to be able to jump and color appropriately.
			FIX = { alt = { "IMPORTANT" } },

			-- Adds mark keyword, used in swift.
			NOTE = { alt = { "MARK" } },
		},
	},
	keys = {
		{
			"<leader>tq",
			"<CMD>Trouble todo toggle<CR>",
			desc = "Todo quick fix list.",
		},
		{
			"<leader><leader>t",
			"<CMD>TodoTelescope<CR>",
			desc = "Todo telescope list.",
		},
		{
			"<leader>tl",
			"<CMD>TodoLocList<CR>",
			desc = "Todo location list.",
		},
		{
			"]t",
			function()
				require("todo-comments").jump_next()
			end,
			desc = "Next todo.",
		},
		{
			"[t",
			function()
				require("todo-comments").jump_prev()
			end,
			desc = "Previous todo.",
		},
	},
}
