-- Easily move lines around
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- Make it so that in visual mode it is easy to move to the beginning and end of each line 
vim.keymap.set("i", "<C-h>", "<C-o>I", {desc = "Go to the start of the line while staying in inerst mode"})
vim.keymap.set("i", "<C-l>", "<C-o>A", {desc = "Go to the end of the line while staying in insert"})
-- Make it so that in insert mode, it is easy to select to the begging, end, or whole line in visual mode
vim.keymap.set("i", "<C-a>", "<Esc>^V")
vim.keymap.set("i", "<C-S-h>", "<C-o>v0")
vim.keymap.set("i", "<C-S-l>", "<C-o>v$")
