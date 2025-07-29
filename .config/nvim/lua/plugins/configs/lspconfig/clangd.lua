vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=**",
    "--clang-tidy",
    "--enable-config",
  },
})

vim.lsp.enable "clangd"
