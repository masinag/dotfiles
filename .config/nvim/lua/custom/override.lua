-- local _, cmp = pcall(require, "cmp")
-- local cmp = require("cmp")

local M = {}

-- M.cmp = {
--   mapping = {
--     ["<CR>"] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = false,
--     },
--   }
-- }


M.treesitter = {
  ensure_installed = {
    "vim",
    "html",
    "css",
    "javascript",
    "json",
    "toml",
    "markdown",
    "c",
    "python",
    "bash",
    "lua",
    "norg",
  },
}

M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.blankline = {
  filetype_exclude = {
    "help",
    "terminal",
    "alpha",
    "packer",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "nvchad_cheatsheet",
    "lsp-installer",
    "norg",
    "",
  },
}

return M
