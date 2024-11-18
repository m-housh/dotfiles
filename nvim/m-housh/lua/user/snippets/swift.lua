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
	s(
		{
			trig = "@dc",
			desc = "Add a dependency client.",
		},
		fmt(
			[[
		public extension DependencyValues {{
			var {}: {} {{
				get {{ self[{}.self] }}
				set {{ self[{}.self] = newValue }}
			}}
		}}

		@DependencyClient
		public struct {} {{

			// Insert interface here.
			{}
		}}

		extension {}: TestDependencyKey {{
			public static let testValue: {} = Self()
		}}

	]],
			{
				i(1, "<name>"),
				i(2, "<Dependency>"),
				rep(2),
				rep(2),
				rep(2),
				i(0),
				rep(2),
				rep(2),
			}
		)
	),

	s(
		{ trig = "str", desc = "Add a struct" },
		fmt(
			[[
	struct {}: {} {{
		{}
	}}
	]],
			{ i(1, "<Name>"), i(2, "<Protocols>"), i(0) }
		)
	),

	s({ trig = "spi", desc = "Add spi modifier." }, fmt("@_spi({})", { i(1, "name") })),

	s(
		{ trig = "sii", desc = "Import with spi." },
		fmt(
			[[
		@_spi({}) import {}
		{}
		]],
			{ i(1, "name"), i(2, "modlue"), i(0) }
		)
	),

	s(
		{ trig = "docf", desc = "Document a function." },
		fmt(
			[[
		/// {}
		///
		/// - Parameters:
		///		- {}: {}
		]],
			{ i(1, "A short description."), i(2, "<param>"), i(3, "<param-description>") }
		)
	),

	s(
		{ trig = "param", desc = "Add a parameter to documentation" },
		fmt(
			[[
		///		- {}: {}
	]],
			{ i(1, "<param>"), i(2, "<description>") }
		)
	),
	s(
		{ trig = "wd", desc = "withDependencies" },
		fmt(
			[[
			withDependencies {{
				$0.{} = {}
			}} operation: {{
				@Dependency(\.{}) var {}
				{}
			}}
	]],
			{
				i(1, "<dependency>"),
				i(2, "<override>"),
				rep(1),
				rep(1),
				i(0),
			}
		)
	),
})
