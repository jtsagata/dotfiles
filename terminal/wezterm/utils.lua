local wezterm = require 'wezterm'
local constants = require('constants')

-- When not focused, set the window background opacity to a lower value
local on_focus = function(window, pane)
    local overrides = window:get_config_overrides() or {}

    if window:is_focused() then
        overrides.window_background_opacity = constants.opacity_active
    else
        overrides.window_background_opacity = constants.opacity_inactive
    end

    window:set_config_overrides(overrides)
end

local get_theme = function()
    if wezterm.gui and wezterm.gui.get_appearance():find("Dark") then
        return constants.dark_theme
    else
        return constants.light_theme
    end
end

return {
    on_focus = on_focus,
    get_theme = get_theme,
}
