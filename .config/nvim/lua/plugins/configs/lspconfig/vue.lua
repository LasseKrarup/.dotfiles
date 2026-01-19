vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue" },
  callback = function()
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = "",
      languages = { "vue" },
      configNamespace = "typescript",
    }

    local ts_ls_config = {
      init_options = {
        plugins = {
          vue_plugin,
        },
      },
      filetypes = tsserver_filetypes,
    }

    -- If you are on most recent `nvim-lspconfig`
    local vue_ls_config = {}

    vim.lsp.config("vue_ls", vue_ls_config)
    vim.lsp.config("ts_ls", ts_ls_config)

    vim.lsp.enable { "ts_ls", "vue_ls" }
  end,
})
