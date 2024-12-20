return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		harpoon:setup({
			settings = {
				save_on_toggle = true,
				sync_on_ui_close = true,
				key = function()
					return vim.loop.cwd()
				end,
			},
		})

		local conf = require("telescope.config").values
		local function toggle_telescope(harpoon_files)
			local file_paths = {}
			for _, item in ipairs(harpoon_files.items) do
				table.insert(file_paths, item.value)
			end

			require("telescope.pickers")
				.new({}, {
					prompt_title = "Harpoon",
					finder = require("telescope.finders").new_table({
						results = file_paths,
					}),
					previewer = conf.file_previewer({}),
					sorter = conf.generic_sorter({}),
				})
				:find()
		end

		-- Keymaps
		vim.keymap.set("n", "<C-e>", function()
			toggle_telescope(harpoon:list())
		end, { desc = "Open Harpoon window" })

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end, { desc = "[A]dd to harpoon list." })
		vim.keymap.set("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle quick menu." })

		-- Buffer key maps. Currently keeping all buffer movements
		-- isolated to top left row of keys on keyboard and all begin
		-- with the <Control> key.

		-- Select buffer numbers.
		vim.keymap.set("n", "<A-y>", function()
			harpoon:list():select(1)
		end, { desc = "Select first harpoon buffer." })
		vim.keymap.set("n", "<A-u>", function()
			harpoon:list():select(2)
		end, { desc = "Select second harpoon buffer." })
		vim.keymap.set("n", "<A-i>", function()
			harpoon:list():select(3)
		end, { desc = "Select third harpoon buffer." })
		vim.keymap.set("n", "<A-o>", function()
			harpoon:list():select(4)
		end, { desc = "Select fourth harpoon buffer." })

		-- Toggle previous and next buffers.
		vim.keymap.set("n", "<C-[>", function()
			harpoon:list():prev()
		end, { desc = "[P]revious harpoon buffer." })
		vim.keymap.set("n", "<C-]>", function()
			harpoon:list():next()
		end, { desc = "[N]ext harpoon buffer." })

		-- Extensions
		harpoon:extend({
			UI_CREATE = function(cx)
				vim.keymap.set("n", "<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, { buffer = cx.buffer, desc = "Open in [V]split" })
			end,
		})
	end,
}
