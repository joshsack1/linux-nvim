-- Set up some basic options
vim.opt.nu = true
vim.opt.relativenumber = true
-- Set up stuff like the tabstop to make it so that it is easier to read stuff
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Set up spellcheck and clipboard access
vim.opt.spelllang = 'en_us'
vim.opt.spell = true
vim.cmd[[
    set clipboard+=unnamedplus
]]

-- Remove the swapfile
vim.opt.swapfile = false

-- Create \x to unhilight search results
vim.keymap.set("n", "<leader>x", ":nohlsearch<CR>")

-- Set H and L to go the beginning or end of a line
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Set up a transparent background
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
