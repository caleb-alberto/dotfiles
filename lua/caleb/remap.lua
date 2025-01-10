vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc = "Back To File Tree"})
vim.keymap.set("v", "<leader>y", '"+y', {desc = "Yank to Clipboard"})
