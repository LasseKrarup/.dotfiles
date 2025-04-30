-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Copy lines up/down
vim.keymap.set("n", "<S-A-j>", "yyp", { noremap = true, desc = "Copy line down" })
vim.keymap.set("i", "<S-A-j>", "<Esc>yypi", { noremap = true, desc = "Copy line down" })
vim.keymap.set("v", "<S-A-j>", "yp", { noremap = true, desc = "Copy selection down" })
vim.keymap.set("n", "<S-A-k>", "yyP", { noremap = true, desc = "Copy line up" })
vim.keymap.set("v", "<S-A-k>", "yP", { noremap = true, desc = "Copy selection up" })
vim.keymap.set("i", "<S-A-k>", "<Esc>yyPi", { noremap = true, desc = "Copy line up" })
