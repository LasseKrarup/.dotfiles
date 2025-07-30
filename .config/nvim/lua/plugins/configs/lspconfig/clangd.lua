vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--query-driver=**",
    "--clang-tidy",
    "--enable-config",
    "--background-index",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
})

vim.lsp.enable "clangd"
