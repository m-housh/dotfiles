return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-telescope/telescope-fzf-native.nvim",
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	build = ":TSUpdate",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		ensure_installed = {
			"bash",
			"cmake",
			"dockerfile",
			"go",
			"hcl",
			"html",
			"java",
			"javascript",
			"json",
			"latex",
			"ledger",
			"llvm",
			"lua",
			"make",
			"markdown",
			"python",
			"swift",
			"toml",
			"xml",
			"yaml",
		}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
		ignore_install = {}, -- List of parsers to ignore installing
		highlight = {
			enable = true, -- false will disable the whole extension
			disable = {}, -- list of language that will be disabled
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "<CR>",
				scope_incremental = "<CR>",
				node_incremental = "<TAB>",
				node_decremental = "<S-TAB>",
			},
		},
		indent = { enable = true },
		autopairs = { { enable = true } },
		textobjects = {
			select = {
				enable = true,
				-- Automatically jump forward to textobj, similar to targets.vim
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
					["al"] = "@loop.outer",
					["il"] = "@loop.inner",
					["ib"] = "@block.inner",
					["ab"] = "@block.outer",
					["ir"] = "@parameter.inner",
					["ar"] = "@parameter.outer",
					["a="] = "@assignment.outer",
					["i="] = "@assignment.inner",
				},
			},
		},
		rainbow = {
			enable = true,
			extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
			max_file_lines = 2000, -- Do not enable for files with more than specified lines
		},
	},
}
