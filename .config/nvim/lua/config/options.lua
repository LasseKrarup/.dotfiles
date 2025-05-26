-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = "unnamedplus"

-- Workaround for kinda broken tmux detection (it detects tmux clipboard when in ssh but no tmux running)
if vim.env.SSH_TTY ~= nil and vim.env.TMUX == nil and vim.env.TERM ~= "tmux-256color" then
  vim.g.clipboard = "osc52"
end
