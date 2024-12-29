return {
	"L3MON4D3/LuaSnip",
	version = "v2.*",
	event = "VeryLazy",
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
		{
			"<C-n>",
			mode = { "i", "s" },
			function()
				local ls = require("luasnip")
				if ls.choice_active() then
					ls.change_choice(1)
				end
			end,
		},
	},
	config = function()
		local ls = require("luasnip")
		ls.setup({
			history = true,
			enable_autosnippets = false,
			updatevents = "TextChanged,TextChangedI",
			extra_opts = {
				[require("luasnip.util.types").choiceNode] = {
					active = {
						virt_text = { { "choiceNode", "Comment" } },
					},
				},
			},
		})

		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })
	end,
}
