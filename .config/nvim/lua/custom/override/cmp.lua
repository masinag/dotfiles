return function()
  local cmp = require "cmp"

  return {
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-8),
    },
  }
end
