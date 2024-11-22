return {
	"folke/todo-comments.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {},
	config = function()
		local todos = require("todo-comments")

		todos.setup({})

		vim.keymap.set("n", "<leader>tq", "<CMD>TodoQuickFix<CR>", { desc = "[T]odo [Q]uick fix list." })
		vim.keymap.set("n", "<leader><leader>t", "<CMD>TodoTelescope<CR>", { desc = "[T]odo telescope list." })
		vim.keymap.set("n", "<leader>tl", "<CMD>TodoLocList<CR>", { desc = "[T]odo [L]ocation list." })
		vim.keymap.set("n", "]t", function()
			todos.jump_next()
		end, { desc = "Next [T]odo" })
		vim.keymap.set("n", "[t", function()
			todos.jump_prev()
		end, { desc = "Previous [T]odo" })
	end,
}
