vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>,", ':vertical resize  -5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>.", ':vertical resize  +5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>[", ':resize  -5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>]", ':resize  +5<CR>', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true})
vim.keymap.set("i", "<leader>/", ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>/", ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>n", ':NERDTreeFocus<CR>', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>/", ':lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    -- Navigate between completion item
    ['<M-k>'] = cmp.mapping.select_prev_item(),
    ['<M-j>'] = cmp.mapping.select_next_item(),

    -- toggle completion
    ['<M-u>'] = cmp_action.toggle_completion(),

    -- Confirm item
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
  }
})

