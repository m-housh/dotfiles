local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

--config.color_scheme = 'rose-pine'

--config.color_scheme = 'terafox'
-- config.colors = {
--   background = "#131111"
-- }

config.color_scheme = "Catppuccin Mocha"

-- Font
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Inconsolata Nerd Font Mono",
})
config.font_size = 16.0

-- Window
config.adjust_window_size_when_changing_font_size = false
config.enable_scroll_bar = false
config.initial_cols = 150
config.initial_rows = 80
config.window_padding = {
	left = 10,
	right = 5,
	top = 0,
	bottom = 0,
}
config.window_close_confirmation = "NeverPrompt"
--config.window_decorations = 'TITLE'
-- Set higher fps
config.max_fps = 120

-- Tab Bar
config.show_tabs_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.use_fancy_tab_bar = true
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

return config
