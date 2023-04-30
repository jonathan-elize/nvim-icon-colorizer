local M = {}

M.config = {
  colors = {
    "Identifier", --#e6c384
    "Type", --#7aa89f
    "String", --#98bb6c
    "Special", --#7fb4ca
    "Boolean", --#ffa066
    "DiagnosticError", --#e82424
    "Statement", --#957fb8
  },
}

local create_default_icons = function(highlightGroups)
  local icons = {}
  local numHighlightGroups = #highlightGroups

  local i = 1
  local devicons = require("nvim-web-devicons").get_icons()
  for _, icon in pairs(devicons) do
    local highlightGroup = highlightGroups[i]
    local fg = require("icon-colorizer.util").hl(highlightGroup).fg

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
  local icons = create_default_icons(M.config.colors)
  require("nvim-web-devicons").set_icon(icons)
end

return M
