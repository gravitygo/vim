-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = LazyVim.safe_keymap_set
-- Zettelkasten: new note
map("n", "<leader>zn", function()
  local notes_dir = vim.fn.expand("~/vaults/zettelkasten/notes")
  local date = os.date("%Y%m%d")
  local files = vim.fn.glob(notes_dir .. "/" .. date .. "-*.md", false, true)
  local index = #files + 1
  local filename = string.format("%s/%s-%03d.md", notes_dir, date, index)

  vim.cmd.edit(filename)
  vim.cmd("ObsidianTemplate zettelkasten")
  vim.cmd.normal("ggA")
end, { desc = "New Zettelkasten note" })
