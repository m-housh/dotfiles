return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	lazy = true,
	config = function()
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		require("telescope").setup({
			ensure_installed = {
				"swift",
			},
			defaults = {
				file_ignore_patterns = { "node_modules", "%.jpg", "%.png", ".swiftpm" },
				vimgrep_arguments = {
					"rg",
					"--follow",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				mappings = {
					i = {
						-- Close on first esc instead of going to normal mode
						["<esc>"] = actions.close,
						["<A-q>"] = actions.send_selected_to_qflist,
						["<C-q>"] = actions.send_to_qflist,
						["<s-tab>"] = actions.toggle_selection + actions.move_selection_next,
						["<tab>"] = actions.toggle_selection + actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<s-tab>"] = actions.toggle_selection + actions.move_selection_next,
						["<tab>"] = actions.toggle_selection + actions.move_selection_previous,
						["<A-q>"] = actions.send_selected_to_qflist,
						["<C-q>"] = actions.send_to_qflist,
					},
				},
				prompt_prefix = " ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "flex",
				layout_config = {
					width = 0.75,
					prompt_position = "bottom",
					preview_cutoff = 120,
					horizontal = { mirror = false },
					vertical = { mirror = true },
				},
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				-- path_display = true, -- strange behaviour not showing the files in result window
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

				-- Developer configurations: Not meant for general override
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
			},
		})

		local map = function(keys, action, desc)
			local opts = { silent = true, noremap = true, desc = desc }
			vim.keymap.set("n", keys, action, opts)
		end

		local find_files = function(dir)
			return function()
				builtin.find_files({ cwd = dir, hidden = true, no_ignore = true })
			end
		end

		vim.keymap.set("n", "<C-A-j>", builtin.jumplist, { silent = true, noremap = true, desc = "Open [J]ump List." })
		map("<leader>ff", builtin.find_files, "[F]ind [F]iles")
		map("<leader>fg", builtin.live_grep, "[F]ind [G]rep")
		map("<leader>fb", builtin.buffers, "[F]ind [B]uffers")
		map("<leader>fh", builtin.help_tags, "[F]ind [H]elp")
		map("<leader>fd", find_files("$DOTFILES"), "[F]ind [D]otfiles")
		map("<leader>fn", find_files("$DOTFILES/nvim/m-housh"), "[F]ind [N]vim file")
		map("<leader>fs", find_files("$DOTFILES/scripts/scripts"), "[F]ind [S]cript")
		map("<leader>fz", find_files("$DOTFILES/zsh/config"), "[F]ind [Z]sh config file")
		map("<leader>gf", builtin.git_files, "Find [G]it [F]iles")
	end,
}
