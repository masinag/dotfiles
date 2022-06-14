local override = require("custom.override")
local M = {}
-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
  theme = "gruvchad",
  -- theme = "onedark",
}


M.plugins = {
  options = {
    lspconfig = {
      setup_lspconf = "custom.plugins.lspconfig",
    },
  },
  override = {
    ["hrsh7th/nvim-cmp"] = override.cmp,
  },
  user = require "custom.plugins",
}

M.mappings = require "custom.mappings"

return M
