-- Hyprland Lua configuration ported from hyprland.conf and sourced *.conf files.
-- Hyprland 0.57+ deprecates the legacy hyprlang config format for Hyprland itself.

----------------
-- MONITORS
----------------
hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = "auto",
})

----------------
-- ENVIRONMENT
----------------
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_STYLE_OVERRIDE", "kvantum")
hl.env("SDL_VIDEODRIVER", "wayland")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "wayland")
hl.env("OZONE_PLATFORM", "wayland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("GDK_SCALE", "2")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XCOMPOSEFILE", "~/.XCompose")

hl.config({
  xwayland = {
    force_zero_scaling = true,
  },
  ecosystem = {
    no_update_news = true,
  },
})

----------------
-- AUTOSTART
----------------
hl.on("hyprland.start", function()
  hl.exec_cmd("uwsm app -- hyprpaper")
  hl.exec_cmd("pidof hypridle | uwsm app -- hypridle")
  hl.exec_cmd("pidof hyprlauncher | uwsm app -- hyprlauncher -d")
  hl.exec_cmd("pidof swaync | uwsm app -- swaync")
  hl.exec_cmd("pidof waybar | uwsm app -- waybar")
  hl.exec_cmd("uwsm app -- clipse -listen")
end)

----------------
-- LOOK AND FEEL
----------------
hl.config({
  general = {
    gaps_in = 3,
    gaps_out = { 0, 5, 5, 5 },
    border_size = 2,
    col = {
      active_border = { colors = { "rgb(89b4fa)", "rgb(f2cdcd)" }, angle = 45 },
      inactive_border = "rgba(595959aa)",
    },
    resize_on_border = true,
    allow_tearing = false,
    layout = "dwindle",
  },

  decoration = {
    rounding = 5,
    rounding_power = 2,
    active_opacity = 1.0,
    inactive_opacity = 1.0,
    shadow = {
      enabled = true,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },
    blur = {
      enabled = true,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = false,
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
    use_active_for_splits = false,
    split_bias = 0,
  },

  master = {
    new_status = "slave",
    mfact = 0.50,
    orientation = "left",
  },

  misc = {
    force_default_wallpaper = 1,
    focus_on_activate = true,
    disable_hyprland_logo = true,
  },
})

hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 },    { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 },       { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 },   { 0.75, 1.0 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 },    { 0.1, 1 } } })

hl.animation({ leaf = "global",        enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",     enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",    enabled = true, speed = 1.49, bezier = "linear",       style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",       enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",          enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",        enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",     enabled = true, speed = 1.5,  bezier = "linear",       style = "fade" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",  enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut", enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

----------------
-- INPUT
----------------
hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "ctrl:nocaps",
    kb_rules = "",
    repeat_rate = 50,
    repeat_delay = 200,
    follow_mouse = 2,
    sensitivity = 0,
    touchpad = {
      natural_scroll = true,
      tap_to_click = false,
    },
  },
})

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

----------------
-- WORKSPACES
----------------
local scripts = "~/.local/scripts/hypr"
local pwa = scripts .. "/webapp launch"
local housecallPro = "https://pro.housecallpro.com/app/calendar_new"
local housecallProLaunch = pwa .. " \"" .. housecallPro .. "\""

-- NOTE: legacy rule `workspace = special:hidden, invisible` has no Lua API field in 0.56.1,
-- so it is intentionally omitted here. Revisit this after upgrading if Hyprland adds it.
hl.workspace_rule({ workspace = "special:pass",     on_created_empty = pwa .. " \"https://pass.proton.me\"" })
hl.workspace_rule({ workspace = "special:dispatch", on_created_empty = housecallProLaunch .. " && " .. housecallProLaunch })
hl.workspace_rule({ workspace = "special:music",    on_created_empty = "ghostty --class=com.ghostty.music -e jellyfin-tui" })
hl.workspace_rule({ workspace = "special:calendar", on_created_empty = "uwsm app -- gnome-calendar" })

----------------
-- KEYBINDINGS
----------------
local mainMod = "SUPER"
local windowMod = "ALT"
local MEH = "ALT + SHIFT + CTRL"
local HYPER = "ALT + SHIFT + SUPER + CTRL"

local terminal = "uwsm app -- kitty"
local browser = "uwsm app -- brave"
local fileManager = terminal .. " -e yazi"
local fileBrowser = "uwsm app -- nautilus"
local menu = "hyprlauncher"
local tmuxSessionator = "~/.local/scripts/tmux-sessionator"
local clipboardHistory = "com.ghostty.clipse " .. terminal .. " --class=com.ghostty.clipse -e clipse"
local utilsLauncher = "com.ghostty.utils-launcher " .. scripts .. "/utils-launcher --launch"

local function bind(mods, key, desc, dispatcher, opts)
  opts = opts or {}
  opts.desc = desc
  local combo = key
  if mods and mods ~= "" then
    combo = mods .. " + " .. key
  end
  return hl.bind(combo, dispatcher, opts)
end

local function raw(dispatcher)
  return hl.dsp.exec_raw(dispatcher)
end

local function exec(cmd)
  return hl.dsp.exec_cmd(cmd)
end

-- Apps / Hyprland controls
bind(mainMod,       "SPACE",  "Application launcher",                    exec(menu))
bind(mainMod,       "RETURN", "New terminal",                            exec(terminal))
bind(mainMod .. " + SHIFT", "RETURN", "New floating terminal",           exec(terminal .. " --class=com.ghostty.float"))
bind(mainMod,       "TAB",    "Focus previous workspace",                exec(scripts .. "/workspacectl switch --to previous"))
bind(mainMod,       "A",      "[A]i - launch / focus",                   exec(pwa .. " --or-focus \"https://ollama.housh.dev\""))
bind(mainMod .. " + SHIFT", "A", "[A]i - new window",                   exec(pwa .. " \"https://ollama.housh.dev\""))
bind(mainMod,       "B",      "New [b]rowser",                           exec(browser))
bind(mainMod .. " + SHIFT", "B", "New private [b]rowser",               exec(browser .. " --incognito"))
bind(mainMod,       "C",      "[C]alendar",                              raw("togglespecialworkspace calendar"))
bind(mainMod .. " + SHIFT", "C", "[C]onfig folder in tmux session",      exec(terminal .. " -e " .. tmuxSessionator .. " ~/.config"))
bind(mainMod,       "D",      "[D]ispatch app - special workspace",      raw("togglespecialworkspace dispatch"))
bind(mainMod .. " + SHIFT", "D", "[D]ispatch app - new window",          exec(pwa .. " --new " .. housecallPro))
bind(mainMod,       "E",      "[E]mail - personal",                      exec(pwa .. " --or-focus \"https://mail.proton.me\""))
bind(mainMod .. " + SHIFT", "E", "[E]mail - work",                      exec(scripts .. "/launch --or-focus thunderbird uwsm app -- thunderbird"))
bind(mainMod,       "F",      "[F]ile manager - terminal",               exec(fileManager))
bind(mainMod .. " + SHIFT", "F", "[F]ile manager - application",         exec(fileBrowser))
bind(mainMod,       "G",      "[G]itea",                                 exec(pwa .. " --or-focus \"https://git.housh.dev\""))
bind(mainMod .. " + SHIFT", "G", "[G]ithub",                            exec(pwa .. " --or-focus \"https://github.com\""))
bind(mainMod,       "H",      "Focus window - left",                     raw("movefocus l"))
bind(mainMod .. " + SHIFT", "H", "Workspace - back",                    raw("workspace -1"))
bind(mainMod,       "I",      "Localsend",                               exec(scripts .. "/launch --or-close localsend uwsm app -- localsend"))
bind(mainMod,       "J",      "Focus window - down",                     raw("movefocus d"))
bind(mainMod,       "K",      "Focus window - up",                       raw("movefocus u"))
bind(mainMod,       "L",      "Focus window - right",                    raw("movefocus r"))
bind(mainMod .. " + SHIFT", "L", "Workspace - forward",                 raw("workspace +1"))
bind(mainMod,       "M",      "[M]usic - jellyfin-tui",                  raw("togglespecialworkspace music"))
bind(mainMod .. " + SHIFT", "M", "[M]enu bar - toggle visible",         exec(scripts .. "/waybarctl --toggle"))
bind(mainMod,       "O",      "Purchase [o]rders",                       exec(pwa .. " --special dispatch \"https://po.housh.dev\""))
bind(mainMod,       "P",      "[P]assword manager",                      raw("togglespecialworkspace pass"))
bind(mainMod .. " + SHIFT", "P", "[P]hotos",                            exec(pwa .. " --or-focus \"https://photos.housh.dev\""))
bind(mainMod .. " + SHIFT", "R", "[R]estart menu bar",                  exec(scripts .. "/waybarctl --restart"))
bind(mainMod,       "S",      "Toggle [s]pecial workspace",              raw("togglespecialworkspace magic"))
bind(mainMod,       "Y",      "[Y]ouTube",                               exec(pwa .. " --or-focus \"https://youtube.com\""))
bind(mainMod,       "U",      "[U]nifi",                                 exec(pwa .. " \"https://unifi.ui.com\""))
bind(mainMod .. " + SHIFT", "U", "[U]tility launcher",                  exec(scripts .. "/launch --or-close " .. utilsLauncher))
bind(mainMod,       "V",      "Clipboard history",                       exec(scripts .. "/launch --or-close " .. clipboardHistory))
bind(mainMod,       "W",      "Close current window",                    raw("killactive"))
bind(mainMod .. " + SHIFT", "W", "Close all windows in active workspace", exec(scripts .. "/windowctl close --active-workspace"))

for i = 1, 10 do
  local key = tostring(i % 10)
  bind(mainMod, key, "Switch to workspace [" .. i .. "]", exec(scripts .. "/workspacectl switch --to " .. i))
end

bind(mainMod .. " + SHIFT", "1", "Switch all workspaces to monitor [1]", exec(scripts .. "/mv-all-workspaces-to-monitor 1"))
bind(mainMod .. " + SHIFT", "0", "Switch all workspaces to monitor [0]", exec(scripts .. "/mv-all-workspaces-to-monitor 0"))

bind(mainMod .. " + SHIFT", "3", "Screenshot a monitor",   exec("hyprshot --mode output --output-folder ~/Pictures"))
bind(mainMod .. " + SHIFT", "4", "Screenshot a selection", exec("hyprshot --mode region --output-folder ~/Pictures"))
bind(mainMod .. " + SHIFT", "5", "Screenshot a window",    exec("hyprshot --mode window --output-folder ~/Pictures"))

bind(mainMod, "mouse_down", "Next existing workspace", raw("workspace e+1"))
bind(mainMod, "mouse_up",   "Previous existing workspace", raw("workspace e-1"))
bind(mainMod, "mouse:272",  "Move window with mouse", raw("movewindow"), { mouse = true })
bind(mainMod, "mouse:273",  "Resize window with mouse", raw("resizewindow"), { mouse = true })
bind(mainMod .. " + SHIFT", "mouse_down", "Resize window with mouse", raw("resizewindow"), { mouse = true })

-- Window controls
bind("CTRL",       "F",     "Toggle [f]ullscreen",                raw("fullscreen"))
bind(windowMod,    "F",     "Toggle [f]loating",                  exec(scripts .. "/windowctl toggle-floating --active --width 80% --height 80%"))
bind(windowMod .. " + SHIFT", "F", "Toggle [f]loating",           exec(scripts .. "/windowctl toggle-floating --active"))
bind(windowMod,    "H",     "Move window - left",                 raw("movewindow l"))
bind(windowMod,    "J",     "Move window - down",                 raw("movewindow d"))
bind(windowMod,    "K",     "Move window - up",                   raw("movewindow u"))
bind(windowMod,    "L",     "Move window - right",                raw("movewindow r"))
bind(windowMod,    "M",     "Move window to [m]usic workspace",   raw("movetoworkspace special:music"))
bind(windowMod .. " + SHIFT", "P", "Toggle [p]seudo window mode", raw("pseudo"))
bind(windowMod,    "S",     "Move window to [s]pecial workspace", raw("movetoworkspacesilent special:magic"))
bind(windowMod,    "W",     "[W]indow actions",                   exec(scripts .. "/windowctl launch action --active"))
bind(windowMod,    "EQUAL", "Increase window size - horizontal",  raw("resizeactive 20 0"))
bind(windowMod,    "MINUS", "Decrease window size - horizontal",  raw("resizeactive -20 0"))
bind(windowMod .. " + SHIFT", "EQUAL", "Increase window size - vertical", raw("resizeactive 0 20"))
bind(windowMod .. " + SHIFT", "MINUS", "Decrease window size - vertical", raw("resizeactive 0 -20"))

for i = 1, 10 do
  local key = tostring(i % 10)
  bind(windowMod, key, "Move window to workspace [" .. i .. "]", raw("movetoworkspace " .. i))
end

-- HYPER controls
bind(HYPER, "H", "[H]ide / show windows", exec(scripts .. "/workspacectl toggle"))
bind(HYPER, "L", "[L]ock computer",       exec("hyprlock"))
bind(HYPER, "W", "Close all windows",      exec(scripts .. "/windowctl close --all"))

for i = 1, 10 do
  local key = tostring(i % 10)
  bind(HYPER, key, "Move window to workspace silent [" .. i .. "]", raw("movetoworkspacesilent " .. i))
end

-- MEH controls
bind(MEH, "L", "[L]ogs picker / viewer", exec(terminal .. " --class=com.ghostty.float -e " .. scripts .. "/utils/logs/logs-picker"))

-- Multimedia keys
bind("", "XF86AudioRaiseVolume",   "Raise volume",       exec("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
bind("", "XF86AudioLowerVolume",   "Lower volume",       exec("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
bind("", "XF86AudioMute",          "Mute volume",        exec("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
bind("", "XF86AudioMicMute",       "Mute microphone",    exec("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
bind("", "XF86MonBrightnessUp",    "Brightness up",      exec("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
bind("", "XF86MonBrightnessDown",  "Brightness down",    exec("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })
bind("", "XF86AudioNext",          "Next track",         exec("playerctl next"),                                { locked = true })
bind("", "XF86AudioPause",         "Pause/play",         exec("playerctl play-pause"),                          { locked = true })
bind("", "XF86AudioPlay",          "Play/pause",         exec("playerctl play-pause"),                          { locked = true })
bind("", "XF86AudioPrev",          "Previous track",     exec("playerctl previous"),                            { locked = true })
