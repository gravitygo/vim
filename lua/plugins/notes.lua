-- lua/plugins/notes.lua
return {
  -- Dependency for Telescope & Obsidian.nvim
  { "nvim-lua/plenary.nvim" },

  -- Zettelkasten-style linking
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",
    },
    opts = {
      workspaces = {
        {
          name = "personal",
          path = "~/vaults/personal",
        },
        {
          name = "work",
          path = "~/vaults/work",
        },
        {
          name = "zettelkasten",
          path = "~/vaults/zettelkasten",
        },
      },

      -- see below for full list of options 👇
    },
  },
  -- Optional wiki-style notes
  { "vimwiki/vimwiki" },

  -- Optional graph visualization of Zettelkasten notes
  { "phaazon/mind.nvim" },

  -- Align tables, markdown, and code easily
  { "junegunn/vim-easy-align" },
}
