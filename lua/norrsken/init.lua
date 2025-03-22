local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

---@class NorrskenBackgroundConfig
---@field light string?
---@field dark string?

---@class NorrskenConfig
---@field comments boolean
---@field keywords boolean
---@field transparent_bg boolean
---@field show_end_of_buffer boolean
---@field lualine_bg_color string?
---@field colors Palette
---@field theme string?
---@field background NorrskenBackgroundConfig?
---@field overrides HighlightGroups | fun(colors: Palette): HighlightGroups
local DEFAULT_CONFIG = {
   italics = {
      comments = false,
      keywords = false,
   },
   transparent_bg = false,
   show_end_of_buffer = false,
   lualine_bg_color = nil,
   colors = require("norrsken.palette"),
   overrides = {},
   theme = "norrsken",
   background = nil,
}

local TRANSPARENTS = {
   "Normal",
   "SignColumn",
   "NvimTreeNormal",
   "NvimTreeVertSplit",
   "NeoTreeNormal",
   "NeoTreeNormalNC",
}

-- Selection-related highlight groups that need to be updated when variant changes
local SELECTION_GROUPS = {
   { name = "CursorLine", color = "selection" },
   { name = "ColorColumn", color = "selection" },
   { name = "Visual", color = "visual" },
   { name = "VisualNOS", color = "visual" },
   { name = "PmenuSel", color = "selection" },
   { name = "TelescopeSelection", color = "selection" },
   { name = "TelescopeMultiSelection", color = "selection" },
   { name = "NvimTreeCursorLine", color = "selection" }
}

-- Snacks Picker-related highlight groups that need forced menu color updates
local SNACKS_MENU_GROUPS = {
   "SnacksPicker",
   "SnacksPickerNormal",
   "SnacksPickerBox",
   "SnacksPickerList",
   "SnacksPickerInput",
   "SnacksPickerPreview"
}

local function apply_term_colors(colors)
   g.terminal_color_0 = colors.black
   g.terminal_color_1 = colors.flare
   g.terminal_color_2 = colors.aurora
   g.terminal_color_3 = colors.glow
   g.terminal_color_4 = colors.twilight
   g.terminal_color_5 = colors.sky
   g.terminal_color_6 = colors.nebula
   g.terminal_color_7 = colors.white
   g.terminal_color_8 = colors.selection
   g.terminal_color_9 = colors.bright_red
   g.terminal_color_10 = colors.bright_green
   g.terminal_color_11 = colors.bright_yellow
   g.terminal_color_12 = colors.bright_blue
   g.terminal_color_13 = colors.bright_magenta
   g.terminal_color_14 = colors.bright_cyan
   g.terminal_color_15 = colors.bright_white
   g.terminal_color_background = colors.bg
   g.terminal_color_foreground = colors.fg
end

--- override colors with colors
---@param groups HighlightGroups
---@param overrides HighlightGroups
---@return HighlightGroups
local function override_groups(groups, overrides)
   for group, setting in pairs(overrides) do
      groups[group] = setting
   end
   return groups
end

-- Apply theme variant
---@param palette Palette
---@param variant string
---@return Palette
local function apply_variant(palette, variant)
   local result = vim.tbl_deep_extend("force", {}, palette)
   
   if variant == "svalbard" then
      result.bg = palette.svalbard_bg
      result.menu = palette.svalbard_menu
      result.black = palette.svalbard_black
      result.selection = palette.svalbard_selection
      result.visual = palette.svalbard_visual
      result.fg = palette.svalbard_fg
      result.comment = palette.svalbard_comment
      result.gutter_fg = palette.svalbard_gutter_fg
      result.nontext = palette.svalbard_nontext
   elseif variant == "kiruna" then
      result.bg = palette.kiruna_bg
      result.menu = palette.kiruna_menu
      result.black = palette.kiruna_black
      result.selection = palette.kiruna_selection
      result.visual = palette.kiruna_visual
      result.fg = palette.kiruna_fg
      result.comment = palette.kiruna_comment
      result.gutter_fg = palette.kiruna_gutter_fg
      result.nontext = palette.kiruna_nontext
   elseif variant == "reykjavik" then
      result.bg = palette.reykjavik_bg
      result.menu = palette.reykjavik_menu
      result.black = palette.reykjavik_black
      result.selection = palette.reykjavik_selection
      result.visual = palette.reykjavik_visual
      result.fg = palette.reykjavik_fg
      result.comment = palette.reykjavik_comment
      result.gutter_fg = palette.reykjavik_gutter_fg
      result.nontext = palette.reykjavik_nontext
   end
   
   return result
end

---apply norrsken colorscheme
---@param configs NorrskenConfig
local function apply(configs)
   local colors = configs.colors
   local theme_to_apply = configs.theme
   
   -- Check if we should use a background-specific variant
   if configs.background then
      local current_bg = o.background
      if current_bg == "dark" and configs.background.dark then
         theme_to_apply = "norrsken-" .. configs.background.dark
      elseif current_bg == "light" and configs.background.light then
         theme_to_apply = "norrsken-" .. configs.background.light
      end
   end
   
   -- Apply theme variant if specified
   if theme_to_apply == "norrsken-svalbard" then
      colors = apply_variant(colors, "svalbard")
   elseif theme_to_apply == "norrsken-kiruna" then
      colors = apply_variant(colors, "kiruna")
   elseif theme_to_apply == "norrsken-reykjavik" then
      colors = apply_variant(colors, "reykjavik")
   end
   
   apply_term_colors(colors)
   local groups = require("norrsken.groups").setup(configs)

   -- apply transparents
   if configs.transparent_bg then
      for _, group in ipairs(TRANSPARENTS) do
         groups[group].bg = nil
      end
   end

   if type(configs.overrides) == "table" then
      groups = override_groups(groups, configs.overrides --[[@as HighlightGroups]])
   elseif type(configs.overrides) == "function" then
      groups = override_groups(groups, configs.overrides(colors))
   end

   -- set defined highlights
   for group, setting in pairs(groups) do
      nvim_set_hl(0, group, setting)
   end
   
   -- Force apply background color to Normal
   vim.api.nvim_set_hl(0, "Normal", { bg = colors.bg })
   
   -- Force apply selection color to selection-related highlight groups
   for _, group in ipairs(SELECTION_GROUPS) do
      local existing = vim.api.nvim_get_hl(0, { name = group.name })
      if existing then
         vim.api.nvim_set_hl(0, group.name, { bg = colors[group.color] })
      end
   end

   -- Force apply menu color to Snacks Picker highlight groups
   for _, group_name in ipairs(SNACKS_MENU_GROUPS) do
      local existing = vim.api.nvim_get_hl(0, { name = group_name })
      if existing then
         vim.api.nvim_set_hl(0, group_name, { bg = colors.menu })
      end
   end
end

---@type NorrskenConfig
local user_configs = {}

--- get norrsken configs
---@return NorrskenConfig
local function get_configs()
   local configs = DEFAULT_CONFIG

   if g.colors_name == "norrsken" or 
      g.colors_name == "norrsken-svalbard" or 
      g.colors_name == "norrsken-kiruna" or 
      g.colors_name == "norrsken-reykjavik" then
      configs.theme = g.colors_name
      configs.colors = require("norrsken.palette")
   end

   configs = tbl_deep_extend("force", configs, user_configs)

   return configs
end

---setup norrsken colorscheme
---@param configs NorrskenConfig?
local function setup(configs)
   if type(configs) == "table" then
      user_configs = configs --[[@as NorrskenConfig]]
   end
end

---load norrsken colorscheme
---@param theme string?
local function load(theme)
   if vim.fn.has("nvim-0.7") ~= 1 then
      vim.notify("norrsken.nvim: you must use neovim 0.7 or higher")
      return
   end

   -- reset colors
   if g.colors_name then
      cmd("hi clear")
   end

   if vim.fn.exists("syntax_on") then
      cmd("syntax reset")
   end

   o.termguicolors = true
   g.colors_name = theme or "norrsken"

   apply(get_configs())
end

return {
   load = load,
   setup = setup,
   configs = get_configs,
   colors = function()
      return get_configs().colors
   end,
}
