local _, cmp = pcall(require, "cmp")

local M = {}

M.cmp = {
  mapping = {
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = false,
    },
  }
}

return M
