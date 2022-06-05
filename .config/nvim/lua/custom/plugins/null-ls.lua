local null_ls = require "null-ls"
local b = null_ls.builtins

local with_diagnostics_code = function(builtin)
  return builtin.with {
    diagnostics_format = "#{m} [#{c}]",
  }
end

local with_root_file = function(builtin, file)
  return builtin.with {
    condition = function(utils)
      return utils.root_has_file(file)
    end,
  }
end

local sources = {
  -- formatting
  b.formatting.prettierd,
  b.formatting.shfmt,
  b.formatting.fixjson,
  -- b.formatting.black.with { extra_args = { "--fast", "--line-length", "88" } },
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort.with { extra_args = { "--profile", "black" } },
  b.formatting.rustfmt,
  with_root_file(b.formatting.stylua, "stylua.toml"),

  -- diagnostics
  b.diagnostics.write_good,
  b.diagnostics.markdownlint,
  -- b.diagnostics.eslint_d,
  -- b.diagnostics.flake8.with { args = { "--max-line-length", "88", "--format", "default", "--stdin-display-name", "$FILENAME", "-" } },
  b.diagnostics.flake8.with { args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" } },
  b.diagnostics.tsc,
  with_root_file(b.diagnostics.selene, "selene.toml"),
  with_diagnostics_code(b.diagnostics.shellcheck),

  -- code actions
  b.code_actions.gitsigns,
  b.code_actions.gitrebase,

  -- hover
  b.hover.dictionary,
}
-- local sources = {
--
--   b.formatting.prettierd.with { filetypes = { "python" } },
--   b.formatting.deno_fmt,
--
--   -- -- Lua
--   b.formatting.stylua,
--   b.diagnostics.luacheck.with { extra_args = { "--global vim" } },
--   --
--   -- Shell
--   b.formatting.shfmt,
--   b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },
-- }
--
local M = {}

M.setup = function()
  null_ls.setup {
    debug = true,
    sources = sources,

    -- format on save
    on_attach = function(client)
      if client.resolved_capabilities.document_formatting then
        vim.cmd "autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()"
      end
    end,
  }
end

return M
-- local M = {}
--
-- local nls = require "null-ls"
-- local nls_utils = require "null-ls.utils"
-- local b = nls.builtins
--
--
--
-- function M.setup()
--   nls.setup {
--     -- debug = true,
--     debounce = 150,
--     save_after_format = false,
--     sources = sources,
--     on_attach = on_attach,
--     root_dir = nls_utils.root_pattern ".git",
--   }
-- end
--
-- return M
