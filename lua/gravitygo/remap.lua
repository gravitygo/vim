vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>,", ':vertical resize  -5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>.", ':vertical resize  +5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>[", ':resize  -5<CR>', { noremap = true, silent = true})
vim.keymap.set("n", "<leader>]", ':resize  +5<CR>', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true})
vim.keymap.set("v", "<leader>p", '"+p', { noremap = true, silent = true})

