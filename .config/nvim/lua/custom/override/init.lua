-- you cant directly call a module in chadrc thats related to the default config
-- Thats because most probably that module is lazyloaded
-- In this case its 'cmp', we have lazyloaded it by default
-- So you need to make this override field a function, instead of a table
-- And the function needs to return a table!
require "custom.override.cmp"

return {
  ["nvim-treesitter/nvim-treesitter"] = require "custom.override.treesitter",
  ["kyazdani42/nvim-tree.lua"] = require "custom.override.nvimtree",
  ["williamboman/mason.nvim"] = require "custom.override.mason",
}
