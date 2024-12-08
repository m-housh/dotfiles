return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local function xcodebuild_device()
			if vim.g.xcodebuild_platform == "macOS" then
				return " macOS"
			end

			if vim.g.xcodebuild_os then
				return " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
			end

			return " " .. vim.g.xcodebuild_device_name
		end

		lualine.setup({
			options = {
				globalstatus = true,
				theme = "auto",
				symbols = {
					alternate_file = "#",
					directory = "",
					readonly = "",
					unnamed = "[No Name]",
					newfile = "[New]",
				},
				disabled_buftypes = { "quickfix", "prompt" },
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = {
				lualine_a = {
					-- { "mode" },
					{ "filename" },
				},
				lualine_b = {
					{ "diagnostics" },
					{ "diff" },
					{
						"searchcount",
						maxcount = 999,
						timeout = 500,
					},
				},
				lualine_c = {},
				lualine_x = {
					{ "' ' .. vim.g.xcodebuild_last_status", color = { fg = "#a6e3a1" } },
					-- { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
					{ xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
				},
				lualine_y = {
					{ "branch" },
				},
				lualine_z = {
					{ "location" },
				},
			},
			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { "filename" },
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			extensions = { "nvim-dap-ui", "quickfix", "trouble", "nvim-tree", "lazy", "mason" },
		})
	end,
}
-- return {
--   "nvim-lualine/lualine.nvim",
--   config = function()
--     local colors = {
--       red = '#ca1243',
--       grey = '#a0a1a7',
--       black = '#383a42',
--       white = '#f3f3f3',
--       light_green = '#83a598',
--       orange = '#fe8019',
--       green = '#8ec07c',
--     }
--
--     local empty = require('lualine.component'):extend()
--     function empty:draw(default_highlight)
--       self.status = ''
--       self.applied_separator = ''
--       self:apply_highlights(default_highlight)
--       self:apply_section_separators()
--       return self.status
--     end
--
--     -- Put proper separators and gaps between components in sections
--     local function process_sections(sections)
--       for name, section in pairs(sections) do
--         local left = name:sub(9, 10) < 'x'
--         for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
--           table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.white } })
--         end
--         for id, comp in ipairs(section) do
--           if type(comp) ~= 'table' then
--             comp = { comp }
--             section[id] = comp
--           end
--           comp.separator = left and { right = '' } or { left = '' }
--         end
--       end
--       return sections
--     end
--
--     local function search_result()
--       if vim.v.hlsearch == 0 then
--         return ''
--       end
--       local last_search = vim.fn.getreg '/'
--       if not last_search or last_search == '' then
--         return ''
--       end
--       local searchcount = vim.fn.searchcount { maxcount = 9999 }
--       return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
--     end
--
--     local function modified()
--       if vim.bo.modified then
--         return '+'
--       elseif vim.bo.modifiable == false or vim.bo.readonly == true then
--         return '-'
--       end
--       return ''
--     end
--
--     local function xcodebuild_device()
--       if vim.g.xcodebuild_platform == "macOS" then
--         return " macOS"
--       end
--
--       local deviceIcon = ""
--       if vim.g.xcodebuild_platform:match("watch") then
--         deviceIcon = "􀟤"
--       elseif vim.g.xcodebuild_platform:match("tv") then
--         deviceIcon = "􀡴 "
--       elseif vim.g.xcodebuild_platform:match("vision") then
--         deviceIcon = "􁎖 "
--       end
--
--       if vim.g.xcodebuild_os then
--         return deviceIcon .. " " .. vim.g.xcodebuild_device_name .. " (" .. vim.g.xcodebuild_os .. ")"
--       end
--
--       return deviceIcon .. " " .. vim.g.xcodebuild_device_name
--     end
--
--
--     require('lualine').setup {
--       options = {
--         theme = 'auto',
--         component_separators = '',
--         section_separators = { left = '', right = '' },
--       },
--       sections = process_sections {
--         lualine_a = { 'mode' },
--         lualine_b = {
--           'branch',
--           'diff',
--           {
--             'diagnostics',
--             source = { 'nvim' },
--             sections = { 'error' },
--             diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
--           },
--           {
--             'diagnostics',
--             source = { 'nvim' },
--             sections = { 'warn' },
--             diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
--           },
--           { 'filename', file_status = false, path = 1 },
--           { modified, color = { bg = colors.red } },
--           {
--             '%w',
--             cond = function()
--               return vim.wo.previewwindow
--             end,
--           },
--           {
--             '%r',
--             cond = function()
--               return vim.bo.readonly
--             end,
--           },
--           {
--             '%q',
--             cond = function()
--               return vim.bo.buftype == 'quickfix'
--             end,
--           },
--         },
--         lualine_c = {},
--         lualine_x = {
--           { "' ' .. vim.g.xcodebuild_last_status", color = { fg = "Gray" } },
--           { "'󰙨 ' .. vim.g.xcodebuild_test_plan", color = { fg = "#a6e3a1", bg = "#161622" } },
--           { xcodebuild_device, color = { fg = "#f9e2af", bg = "#161622" } },
--         },
--         lualine_y = { search_result, 'filetype' },
--         lualine_z = { '%l:%c', '%p%%/%L' },
--       },
--       inactive_sections = {
--         lualine_c = { '%f %y %m' },
--         lualine_x = {},
--       },
--       tabline = {},
--       extensions = {"nvim-tree"}
--     }
--   end
-- }
