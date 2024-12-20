return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
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
	},
	keys = {
		-- Show the parent directory in current window.
		{ "-", "<CMD>Oil<CR>", desc = "Open directory." },
		-- Open parent directory in floating window.
		{
			"<leader>-",
			function()
				require("oil").toggle_float()
			end,
			desc = "Open directory in float.",
		},
	},
}
