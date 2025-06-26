-- https://github.com/michaelbrusegard/tabline.wez
local wezterm = require 'wezterm'
local utils = require('utils')

local tabline = wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")
tabline.setup({
  options = {
    icons_enabled = true,
    theme = utils.get_theme(),
    tabs_enabled = false,
    theme_overrides = {},
    section_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
    component_separators = {
      left = wezterm.nerdfonts.pl_left_soft_divider,
      right = wezterm.nerdfonts.pl_right_soft_divider,
    },
    tab_separators = {
      left = wezterm.nerdfonts.pl_left_hard_divider,
      right = wezterm.nerdfonts.pl_right_hard_divider,
    },
  },
  sections = {
    -- tabline_a = { 'domain' },
    -- tabline_b = { 'window' },
    tabline_a = { 'ram' },
    tabline_b = { 'cpu' },
    tabline_c = { nil },
    tab_active = { nil },
    tab_inactive = { nil },
    tabline_x = { nil },
    tabline_y = { nil },
    tabline_z = { 'datetime' },
  },
  extensions = {},
})

return tabline
