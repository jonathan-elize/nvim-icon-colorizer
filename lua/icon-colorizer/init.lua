local M = {}

M.config = {
  colors = {
    theme1 = "Identifier",      --#e6c384
    theme2 = "Type",            --#7aa89f
    theme3 = "String",          --#98bb6c
    theme4 = "Special",         --#7fb4ca
    theme5 = "Boolean",         --#ffa066
    theme6 = "DiagnosticError", --#e82424
    theme7 = "Statement",       --#957fb8
  },
  theme_icons = {
    theme1 = { "Java" },
    theme2 = {},
    theme3 = {},
    theme4 = {},
    theme5 = {},
    theme6 = {},
    theme7 = {},
  },
}

local util = require("icon-colorizer.util")

local create_default_icons = function(config)
  local icons = {}
  local numHighlightGroups = util.get_num_keys_from_table(config.colors)

  local icon_theme_map = {}
  for theme, icons_list in pairs(config.theme_icons) do
    for _, icon in ipairs(icons_list) do
      icon_theme_map[icon] = theme
    end
  end

  local i = 1
  local devicons = require("nvim-web-devicons").get_icons()
  for _, icon in pairs(devicons) do
    local theme_key = icon_theme_map[icon.name] or ("theme" .. i)
    local target_theme = config.colors[theme_key]

    local fg = util.hl(target_theme).fg
    icon.color = fg
    icons[icon.name] = icon

    if i == numHighlightGroups then
      i = 1
    else
      i = i + 1
    end
  end
  return icons
end

M.setup = function(config)
  M.config = vim.tbl_extend("force", M.config, config or {})
  local icons = create_default_icons(M.config)
  require("nvim-web-devicons").set_icon(icons)
end

return M
