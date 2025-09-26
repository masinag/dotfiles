local en_general_dict = vim.fn.readfile(vim.fn.expand("~/.config/nvim/ltex/en_general.txt"))

local en_us = en_general_dict
local en_gb = en_general_dict

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ltex = {
        settings = {
          ltex = {
            checkFrequency = "save",
            language = "en-US",
            additionalRules = {
              enablePickyRules = true,
            },
            dictionary = {
              ["en-US"] = en_us,
              ["en-GB"] = en_gb,
            },
          },
        },
        filetypes = { "tex", "bib", "markdown" },
      },
    },
  },
}
