return {
  "epwalsh/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/vaults/trading",
      },
      {
        name = "work",
        path = "~/vaults/work",
      },
      {
        name = "archive",
        path = "~/vaults/archive",
      },
    },
    templates = {
      folder = ".templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
