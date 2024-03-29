-- Just an example, supposed to be placed in /lua/custom/

local M = {}

-- make sure you maintain the structure of `core/default_config.lua` here,
-- example of changing theme:

M.ui = {
	theme = "gruvchad",
}

-- local pluginConfs = require "custom.plugins.configs"

M.plugins = {
	user = require("custom.plugins"),
	override = require("custom.override"),
}
print(M)

M.mappings = require("custom.mappings")

return M
