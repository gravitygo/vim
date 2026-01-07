return {
  {
    "GCBallesteros/jupytext.vim",
    config = function()
      vim.g.jupytext_fmt = "py:percent" -- best for vim/neovim diff
    end,
  },
}
