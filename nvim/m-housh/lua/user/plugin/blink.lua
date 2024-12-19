return {
	{
		"saghen/blink.cmp",
		dependencies = {
			"rafamadriz/friendly-snippets",
			--"L3MON4D3/LuaSnip",
		},
		version = "v0.*",
		opts = {
			appearance = {
				use_nvim_cmp_as_default = true,
				nerd_font_variant = "mono",
			},
			signature = { enabled = true },
			keymap = {
				preset = "default",
				["<CR>"] = { "accept", "fallback" },
				["<C-space>"] = {
					function(cmp)
						cmp.show({ providers = { "snippets" } })
					end,
				},
				--["<C-k>"] = { "select_prev", "fallback" },
				--["<C-j>"] = { "select_next", "fallback" },
				["<C-n>"] = {
					function(cmp)
						if cmp.snippet_active() then
							return cmp.accept()
						else
							return cmp.select_and_accept()
						end
					end,
					"snippet_forward",
					"fallback",
				},
			},
			-- 			snippets = {
			-- 				expand = function(snippet)
			-- 					require("luasnip").lsp_expand(snippet)
			-- 				end,
			-- 				active = function(filter)
			-- 					if filter and filter.direction then
			-- 						return require("luasnip").jumpable(filter.direction)
			-- 					end
			-- 					return require("luasnip").in_snippet()
			-- 				end,
			-- 				jump = function(direction)
			-- 					require("luasnip").jump(direction)
			-- 				end,
			-- 			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
		opts_extend = { "sources.default" },
	},
}
