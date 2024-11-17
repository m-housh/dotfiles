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
			},
			view_options = {
				--show_hidden = true,
				is_hidden_file = function(name, bufnr)
					-- Don't show .DS_STORE in output.
					local is_ds_store = name ~= ".DS_Store"
					return not is_ds_store
				end,
			},
		})

		-- Show the parent directory in current window.
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory." })

		-- Open parent directory in floating window.
		vim.keymap.set("n", "<space>-", require("oil").toggle_float)
	end,
}
