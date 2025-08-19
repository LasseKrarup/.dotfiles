local map = vim.keymap.set

-- general mappings
map("n", "<C-s>", "<cmd> w <CR>", { desc = "Save buffer" })
map("i", "jk", "<ESC>")
map("n", "<C-y>", "<cmd> %y+ <CR>") -- copy whole filecontent

-- bufferline, cycle buffers
map("n", "<Tab>", "<cmd> BufferLineCycleNext <CR>", { desc = "Next tab" })
map("n", "<S-Tab>", "<cmd> BufferLineCyclePrev <CR>", { desc = "Previous tab" })
map("n", "<C-q>", "<cmd> bd <CR>", { desc = "Delete buffer" })

-- COMMENTS
map("n", "<leader>/", "gcc", { remap = true, desc = "Comment line" })
map("v", "<leader>/", "gc", { remap = true, desc = "Comment line" })
map("n", "<leader>cml", "<cmd> CBllline <CR>", { desc = "Fancy line comment" })
map("n", "<leader>cmb", "<cmd> CBalbox <CR>", { desc = "Fancy box comment" })

-- format
map({ "n", "v" }, "<leader>fm", function()
  require("conform").format({ lsp_fallback = true, })
end, { desc = "Format buffer" })

-- Clear highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- ── COPY LINE DOWN/UP ───────────────────────────────────────────────
vim.keymap.set("n", "<S-M-j>", "yyp", { desc = "Copy line down" })
vim.keymap.set("n", "<S-M-k>", "yyP", { desc = "Copy line up" })
-- ──────────────────────────────────────────────────────────────────────

-- ── TypstPreview ────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>tp", "<cmd>TypstPreview<CR>", { desc = "Open Typst Preview" })
-- ──────────────────────────────────────────────────────────────────────

-- ── Exit terminal mode ──────────────────────────────────────────────
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- ──────────────────────────────────────────────────────────────────────

-- ── GIT ─────────────────────────────────────────────────────────────
vim.keymap.set("n", "<leader>ghp", "<cmd>Gitsigns preview_hunk<CR>", { desc = "Preview Git Hunk" })
