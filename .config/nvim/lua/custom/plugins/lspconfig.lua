local M = {}

M.setup_lsp = function(attach, capabilities)
  local lspconfig = require "lspconfig"

  -- lspservers with default config
  local servers = { "sumneko_lua", "ccls", "html", "bashls", "pyright", "rust_analyzer", "cmake" }

  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = attach,
      capabilities = capabilities,
    }
  end

  lspconfig.sumneko_lua.setup {
    settings = {
      Lua = {
        diagnostics = {
          globals = { 'vim', 'use' }
        }
      }
    }
  }
  -- lspconfig.ccls.setup {
  --   init_options = {
  --     compilationDatabaseDirectory = "./build/"
  --   }
  -- }
end

return M
