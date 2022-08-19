local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- python
  b.formatting.black.with { extra_args = { "--fast" } },
  b.formatting.isort.with { extra_args = { "--profile", "black" } },
  b.diagnostics.flake8.with { args = { "--format", "default", "--stdin-display-name", "$FILENAME", "-" } },

  -- rust
  b.formatting.rustfmt,

  -- cpp
  b.formatting.clang_format,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
