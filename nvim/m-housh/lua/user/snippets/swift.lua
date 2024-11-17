-- Setup snippets.
local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local ms = ls.multi_snippet
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep
-- Add snippets
ls.add_snippets("swift", {
	-- Add a dependency snippet.
	s("@d", fmt("@Dependency(\\.{}) var {}", { i(1), rep(1) })),

	-- Add a dependency client.
	s("@dc", fmt([[
		public extension DependencyValues {{
			var {}: {} {{
				get: {{ self[{}.self] }}
				set: {{ self[{}.self] = newValue }}
			}}
		}}

		@DependencyClient
		struct {} {{
			// Insert interface here.
		}}

		extension {}: TestDependencyKey {{
			static let testValue: {} = Self()
		}}

	]], {
			i(1, "<var-name>"),
			i(2, "<Type>"),
			rep(2),
			rep(2),
			rep(2),
			rep(2),
			rep(2),
		})
	),

	-- Add spi modifier snippet.
	s("spi", fmt("@_spi({})", { i(1, "name") })),

	-- Add spi import modifier snippet.
	s("sii", fmt("@_spi({}) import {}", { i(1, "name"), i(2, "modlue") })),

	-- Document a function.
	s("doc", fmt([[
		/// {}
		///
		/// - Parameters:
		///		- {}: {}
		]], { i(1, "A short description."), i(2, "<param>"), i(3, "<param-description>") }
	)),

	s("param", fmt([[
		///		- {}: {}
	]], { i(1, "<param>"), i(2, "<description>") })),
})
