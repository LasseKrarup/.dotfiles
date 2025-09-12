vim.lsp.config("omnisharp", {
  cmd = { "OmniSharp", "-z", "--hostPID", "12345", "DotNet:enablePackageRestore=false", "--encoding", "utf-8", "--languageserver" }
})

vim.lsp.enable "omnisharp"
