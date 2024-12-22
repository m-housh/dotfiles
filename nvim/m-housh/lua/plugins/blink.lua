-- https://cmp.saghen.dev/
return {
	{
		"saghen/blink.cmp",
		enabled = true,
		dependencies = {
			-- "rafamadriz/friendly-snippets",
			{ "L3MON4D3/LuaSnip", version = "v2.*" },
		},
		version = "v0.*",
		opts = {
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer", "luasnip" },
				providers = {
					lsp = {
						name = "lsp",
						enabled = true,
						module = "blink.cmp.sources.lsp",
						score_offset = 1000, -- higher = higher priority
					},
					luasnip = {
						name = "luasnip",
						enabled = true,
						module = "blink.cmp.sources.luasnip",
						score_offset = 950,
					},
					snippets = {
						name = "snippets",
						enabled = true,
						module = "blink.cmp.sources.snippets",
						score_offset = 900,
					},
				},
			},
			snippets = {
				expand = function(snippet)
					require("luasnip").lsp_expand(snippet)
				end,
				active = function(filter)
					if filter and filter.direction then
						return require("luasnip").jumpable(filter.direction)
					end
					return require("luasnip").in_snippet()
				end,
				jump = function(direction)
					require("luasnip").jump(direction)
				end,
			},
		},
		opts_extend = { "sources.default" },
		keymap = { preset = "default" },
	},
}
