return {
  "lervag/vimtex",
  lazy = false,
  init = function()
    vim.g.vimtex_view_method = "zathura"
    vim.g.vimtex_compiler_latexmk = {
      out_dir = "out",
      options = {
        "-shell-escape",
      },
    }
  end,
}
