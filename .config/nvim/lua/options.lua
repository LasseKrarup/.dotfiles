local o = vim.o

vim.g.mapleader = " "

vim.g.have_nerd_font = true

o.laststatus = 3 -- global statusline
o.showmode = false

o.clipboard = "unnamedplus"

-- enable 24-bit colour
o.termguicolors = true

-- Indenting
o.expandtab = true
o.shiftwidth = 2
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2

vim.opt.fillchars = { eob = " " }
o.ignorecase = true
o.smartcase = true
o.mouse = "a"

o.number = true

o.signcolumn = "yes"
o.splitbelow = true
o.splitright = true
o.timeoutlen = 400
o.undofile = true
o.cursorline = true

vim.api.nvim_set_hl(0, "IndentLine", { link = "Comment" })

o.spell = true
o.spelllang = "en,da"

o.virtualedit = "block" -- Allow cursor to move where there is no text in visual block mode

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0
