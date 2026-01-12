-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local vaults_path = vim.fn.expand("~/vaults")

-- Core function to set a workspace (without picker)
local function set_workspace(workspace_name)
  local workspace_path = vaults_path .. "/" .. workspace_name

  if vim.fn.isdirectory(workspace_path) ~= 1 then
    vim.notify("Workspace does not exist: " .. workspace_name, vim.log.levels.ERROR)
    return
  end

  -- Change Neovim cwd
  vim.cmd("cd " .. vim.fn.fnameescape(workspace_path))
  vim.notify("Workspace set to: " .. workspace_name, vim.log.levels.INFO)

  -- Tell Obsidian.nvim
  vim.cmd("ObsidianWorkspace " .. workspace_name)

  -- Update Neo-Tree root if loaded
  if package.loaded["neo-tree"] then
    require("neo-tree.sources.filesystem").change_root(workspace_path)
  end
end

-- Telescope picker function
local function pick_workspace()
  local pickers = require("telescope.pickers")
  local finders = require("telescope.finders")
  local actions = require("telescope.actions")
  local action_state = require("telescope.actions.state")
  local conf = require("telescope.config").values

  local workspaces = vim.fn.globpath(vaults_path, "*", false, true)
  workspaces = vim.tbl_filter(function(path)
    return vim.fn.isdirectory(path) == 1
  end, workspaces)

  pickers
    .new({}, {
      prompt_title = "Use Workspace",
      finder = finders.new_table({
        results = workspaces,
        entry_maker = function(path)
          return {
            value = path,
            display = vim.fn.fnamemodify(path, ":t"),
            ordinal = path,
          }
        end,
      }),
      sorter = conf.generic_sorter({}),
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if not selection then
            return
          end

          local workspace_name = vim.fn.fnamemodify(selection.value, ":t")
          set_workspace(workspace_name)
        end)
        return true
      end,
    })
    :find()
end

-- Ex command: UseWorkspace
-- If a name is given, set it directly
-- If no name, open Telescope picker
vim.api.nvim_create_user_command("UseWorkspace", function(opts)
  if opts.args ~= "" then
    set_workspace(opts.args)
  else
    pick_workspace()
  end
end, { nargs = "?" })
