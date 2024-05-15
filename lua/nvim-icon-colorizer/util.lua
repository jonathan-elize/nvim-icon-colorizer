local M = {}

M.getHlFg = function(hl)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hl)), "fg#")
end

M.getHlBg = function(hl)
  return vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID(hl)), "bg#")
end

return M
