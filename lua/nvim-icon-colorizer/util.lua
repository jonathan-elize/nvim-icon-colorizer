local M = {}

M.hl = function(name)
  local highlight = vim.api.nvim_get_hl_by_name(name, true)
  setmetatable(highlight, {
    __index = function(self, key)
      if key == "bg" then
        return self.background
      end
      if key == "fg" then
        return self.foreground
      end

      return nil
    end,
  })
  return highlight
end

M.get_num_keys_from_table = function(table)
  local numKeys = 0
  for _, _ in pairs(table) do
    numKeys = numKeys + 1
  end
  return numKeys
end

return M
