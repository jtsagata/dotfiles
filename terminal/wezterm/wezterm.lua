-- A good tutorial: https://alexplescan.com/posts/2024/08/10/wezterm/
-- Reference: https://wezterm.org/config/files.html
-- Lua Reference: https://wezterm.org/config/lua/general.html

local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local constants = require('constants')
local tabline = require('tabline')
local utils = require('utils')


config.default_prog = constants.prog
-- config.initial_cols = constants.width
-- config.initial_rows = constants.height
config.color_scheme = utils.get_theme()
config.font_size = constants.font_size

config.font = wezterm.font_with_fallback {
  constants.font,
  'Droid Sans Mono',
  'monospace',
}


config.enable_scroll_bar = false
config.enable_tab_bar = true
config.use_fancy_tab_bar = false
config.show_new_tab_button_in_tab_bar = false
config.show_tabs_in_tab_bar = false
config.integrated_title_button_style = 'Windows'
-- config.front_end = 'WebGpu'

config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_close_confirmation = 'NeverPrompt'
config.window_padding = constants.padding
config.window_frame = constants.border

config.window_background_opacity = constants.opacity_active
wezterm.on('window-focus-changed', utils.on_focus)



-- Visual bell configuration
config.visual_bell = {
  fade_in_function = 'EaseIn',
  fade_in_duration_ms = 250,
  fade_out_function = 'EaseOut',
  fade_out_duration_ms = 250,
  target = 'CursorColor',
}

config.colors = {
  visual_bell = '#302020',
}
config.cursor_blink_rate = 2000
config.default_cursor_style = 'BlinkingUnderline'
config.cursor_thickness = 2

-- Mouse bindings, open links with CTRL-Click
local act = wezterm.action
config.bypass_mouse_reporting_modifiers = 'CTRL'
config.mouse_bindings = {
  {
    event = { Up = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.OpenLinkAtMouseCursor,
  },
  -- Disable the 'Down' event of CTRL-Click to avoid weird program behaviors
  {
    event = { Down = { streak = 1, button = 'Left' } },
    mods = 'CTRL',
    action = act.Nop,
  },
}

--   --  This failed of cosmic
-- TODO:  Check cosmic
wezterm.on('gui-startup', function(cmd)
  -- https://github.com/wezterm/wezterm/issues/6990
  local active_screen = wezterm.gui.screens()["active"]
  local _, _, window = wezterm.mux.spawn_window(cmd or {})
  wezterm.log_info("Active screen: " ..
    active_screen.name .. " (" .. active_screen.width .. "x" .. active_screen.height .. ")")

  --  This failed of cosmic
  local width = active_screen.width / 2
  local height = active_screen.height / 2

  wezterm.log_info("Set Size:" .. " Width: " .. width .. ", Height: " .. height)
  window:gui_window():set_inner_size(width, height)
end)

-- wezterm.on('window-resized', function(window, pane)
--   local _, _, window = wezterm.mux.spawn_window(cmd or {})
--   local width, height, dpi, fullscreen = window:gui_window():get_dimensions()
--   wezterm.log_info("Set Size:" .. " Width: " .. width .. ", Height: " .. height)
-- end)

-- wezterm.on('window-config-reloaded', function(window)
--   recompute_padding(window)
-- end)

-- Finally, return the configuration to wezterm:
return config
