return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	event = "VeryLazy",
	opts = {
		history = true,
		enable_autosnippets = false,
		updatevents = "TextChanged,TextChangedI",
		extra_opts = {
			[require("luasnip.utl.types").choiceNode] = {
				active = {
					virt_text = { { "choiceNode", "Comment" } },
				},
			},
		},
	},
	keys = {
		{
			"<C-k>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")
				if ls.expand_or_jumpable() then
					ls.expand_or_jump()
				end
			end,
		},
		{
			"<C-j>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")
				if ls.jumpable(-1) then
					ls.jump(-1)
				end
			end,
		},
	},
	config = function(_, opts)
		local ls = require("luasnip")
		ls.setup(opts)

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
	end,
}
