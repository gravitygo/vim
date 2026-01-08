-- lua/plugins/notes.lua
return {
  -- Optional wiki-style notes
  { "vimwiki/vimwiki" },

  -- Optional graph visualization of Zettelkasten notes
  {
    "Selyss/mind.nvim",
    branch = "v2.2",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- optional, used for icons
    },
    opts = {
      -- your configuration comes here
    },
  },

  -- Align tables, markdown, and code easily
  { "junegunn/vim-easy-align" },
}
