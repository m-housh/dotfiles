return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	keys = {
		{ "<leader>d", "<cmd>Trouble diagnostics toggle<cr>", { desc = "Trouble [D]iagnostics" } },
		{ "<leader>dq", "<cmd>Trouble quickfix toggle<cr>", { desc = "Trouble [Q]uikfix." } },
		{ "<leader>dl", "<cmd>Trouble loclist toggle<cr>", { desc = "Trouble [L]ocation list" } },
	},

	opts = {},
	config = function()
		require("trouble").setup({
			auto_open = false,
			auto_close = false,
			auto_preview = true,
			auto_jump = false,
			mode = "quickfix",
			severity = vim.diagnostic.severity.ERROR,
			cycle_results = false,
		})
		vim.api.nvim_create_autocmd("User", {
			pattern = { "XcodebuildBuildFinished", "XcodebuildTestsFinished" },
			callback = function(event)
				if event.data.cancelled then
					return
				end

				if event.data.success then
					require("trouble").close()
				elseif not event.data.failedCount or event.data.failedCount > 0 then
					if next(vim.fn.getqflist()) then
						require("trouble").open("quickfix")
					else
						require("trouble").close()
					end

					require("trouble").refresh()
				end
			end,
		})
		-- Jump to diagnostic issues across the whole project.
		vim.keymap.set("n", "<A-d>", "<cmd>silent cc | silent cn<cr>zz", { desc = "Jump to next issue" })
		vim.keymap.set("n", "<A-s>", "<cmd>silent cc | silent cp<cr>zz", { desc = "Jump to previous issue" })
	end,
}
