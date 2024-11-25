return {
	"stevearc/oil.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("oil").setup({
			columns = { "icon" },
			keymaps = {
				["<C-h>"] = false,
				["<M-h>"] = "actions.select_split",
				["<C-v>"] = {
					"actions.select",
					opts = { vertical = true },
					desc = "Open the entry in a vertical split",
				},
			},
			view_options = {
				is_hidden_file = function(name, _) -- second arg is bufnr, but not currently used.
					-- Don't show .DS_Store in output.
					local is_ds_store = name ~= ".DS_Store"
					return not is_ds_store
				end,
			},
		})

		-- Show the parent directory in current window.
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory." })

		-- Open parent directory in floating window.
		vim.keymap.set("n", "<space>-", require("oil").toggle_float)

		-- Old habits die hard, map what used to toggle neo-tree to just open a float.
		vim.keymap.set("n", "<C-n>", require("oil").toggle_float)
	end,
}
