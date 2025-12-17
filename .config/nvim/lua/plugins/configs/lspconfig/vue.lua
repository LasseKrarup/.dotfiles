vim.api.nvim_create_autocmd("FileType", {
  pattern = { "vue" },
  callback = function()
    local root_path = vim.fs.root(0, "node_modules")
    local vue_language_server_path = vim.fs.joinpath(root_path, "/@vue/language-server")
    local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
    local vue_plugin = {
      name = "@vue/typescript-plugin",
      location = vue_language_server_path,
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
  once = true,
})
