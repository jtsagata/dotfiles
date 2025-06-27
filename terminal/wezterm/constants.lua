local wezterm = require 'wezterm'
local M = {}

M.prog = { wezterm.home_dir .. "/.local/bin/zelly" }
M.prog = { "fish" }
-- M.prog = { "/usr/bin/zellij"}

M.width = 146
M.height = 32

M.light_theme = "catppuccin-macchiato"
-- M.dark_theme = "catppuccin-mocha"
-- M.dark_theme = "catppuccin-latte"
M.dark_theme = "GruvboxDark"

M.font = "JetBrainsMono Nerd Font Mono"
M.font_size = 11.0

M.opacity_inactive = 0.85
M.opacity_active = 0.98

M.border_width = '0.15cell'
M.border_color = 'gray'

M.border = {
  border_left_width = M.border_width,
  border_right_width = M.border_width,
  border_bottom_height = M.border_width,
  border_top_height = M.border_width,
  border_left_color = M.border_color,
  border_right_color = M.border_color,
  border_bottom_color = M.border_color,
  border_top_color = M.border_color,
}

M.padding = {
  left = 1,
  right = 1,
  top = 2,
  bottom = 1,
}

return M
