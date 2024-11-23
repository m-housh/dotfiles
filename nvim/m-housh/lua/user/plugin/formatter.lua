return {
	"mhartington/formatter.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local util = require("formatter.util")
		require("formatter").setup({
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
					function()
						return {
							exe = "stylua",
							args = {
								"--search-parent-directories",
								"--stdin-filepath",
								util.escape_path(util.get_current_buffer_file_path()),
								"--",
								"-",
							},
							stdin = true,
						}
					end,
				},
				markdown = function()
					return {
						exe = "prettier",
						args = {
							"--stdin-filepath",
							util.escape_path(util.get_current_buffer_file_path()),
							"--print-width",
							"100",
							"--prose-wrap",
							"always",
							"--parser",
							"markdown",
						},
						stdin = true,
						try_node_modules = true,
					}
				end,
				swift = function()
					return {
						exe = "swiftformat",
					}
				end,
				["*"] = {
					-- formatter for any / all file types.
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})

		-- Keymaps
		local wk = require("which-key")
		wk.add({
			{ "<space>f", ":Format", desc = "[F]ormat" },
			{ "<space>F", ":FormateWrite", desc = "[F]ormat write" },
		}, { mode = "n", silent = true })

		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd

		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})
	end,
}
