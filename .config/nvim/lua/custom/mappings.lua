local M = {}

M.custom = {
	v = {
		["J"] = { ":m '>+1<cr>gv=gv", "Move line(s) down" },
		["K"] = { ":m '<-2<cr>gv=gv", "Move line(s) up" },
	},
}

return M
