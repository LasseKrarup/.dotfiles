-- ╭──────────────╮
-- │ Autocommands │
-- ╰──────────────╯

-- ── Highlight text yank ─────────────────────────────────────────────
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- ── AUTOCOMMAND FOR C/C++ SOURCE/HEADER SWITCHING ───────────────────
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "c", "cpp", "h", "hpp" },
  callback = function()
    vim.keymap.set("n", "<leader>ch", "<cmd>LspClangdSwitchSourceHeader<CR>", {
      buffer = true,
      desc = "Switch between source and header file"
    })
  end,
})
-- ──────────────────────────────────────────────────────────────────────
