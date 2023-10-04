local wezterm = require('wezterm')
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

--config.color_scheme = 'rose-pine'
config.color_scheme = 'nightfox'
config.font = wezterm.font_with_fallback {
  'JetBrains Mono',
  'nonicons'
}
config.font_size = 16.0

config.use_fancy_tab_bar = false

config.enable_scroll_bar = false
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0
}
config.window_close_confirmation = 'NeverPrompt'
config.window_decorations = 'TITLE'

config.tab_bar_at_bottom = true

return config
