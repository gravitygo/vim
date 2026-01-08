return {
  "epwalsh/obsidian.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  keys = {
    {
      "<leader>zn",
      function()
        local notes_dir = vim.fn.expand("~/vaults/zettelkasten/notes")

        local date = os.date("%Y%m%d")
        local files = vim.fn.glob(notes_dir .. "/" .. date .. "-*.md", false, true)
        local index = #files + 1

        local filename = string.format("%s/%s-%03d.md", notes_dir, date, index)

        vim.cmd("edit " .. filename)
        vim.cmd("ObsidianTemplate zettelkasten")
        vim.cmd("normal! ggA")
      end,
      desc = "New Zettelkasten note",
    },
  },
  opts = {
    picker = {
      -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
      name = "telescope.nvim",
      -- Optional, configure key mappings for the picker. These are the defaults.
      -- Not all pickers support all mappings.
      note_mappings = {
        -- Create a new note from your query.
        new = "<C-x>",
        -- Insert a link to the selected note.
        insert_link = "<C-l>",
      },
      tag_mappings = {
        -- Add tag(s) to current note.
        tag_note = "<C-x>",
        -- Insert a tag at the current location.
        insert_tag = "<C-l>",
      },
    },
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
        name = "Zettelkasten",
        path = "~/vaults/zettelkasten",
      },
    },
    mappings = {
      -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
      ["gf"] = {
        action = function()
          return require("obsidian").util.gf_passthrough()
        end,
        opts = { noremap = false, expr = true, buffer = true },
      },
      -- Toggle check-boxes.
      ["<leader>ch"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      -- Smart action depending on context, either follow link or toggle checkbox.
      ["<cr>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
    -- URL it will be ignored but you can customize this behavior here.
    ---@param url string
    follow_url_func = function(url)
      -- Open the URL in the default web browser.
      vim.fn.jobstart({ "open", url }) -- Mac OS
      -- vim.fn.jobstart({"xdg-open", url})  -- linux
      -- vim.cmd(':silent exec "!start ' .. url .. '"') -- Windows
      -- vim.ui.open(url) -- need Neovim 0.10.0+
    end,

    -- Optional, by default when you use `:ObsidianFollowLink` on a link to an image
    -- file it will be ignored but you can customize this behavior here.
    ---@param img string
    follow_img_func = function(img)
      local sys = vim.loop.os_uname().sysname
      if sys == "Linux" then
        vim.fn.jobstart({ "xdg-open", img })
      elseif sys:match("Windows") then
        vim.fn.jobstart({ "cmd.exe", "/c", "start", img })
      end
    end,
    templates = {
      folder = ".templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
      -- A map for custom variables, the key should be the variable and the value a function
      substitutions = {},
    },
  },
}
