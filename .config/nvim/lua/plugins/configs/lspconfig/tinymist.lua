vim.lsp.config("tinymist", {
  on_attach = function(client, bufnr)
    vim.keymap.set("n", "<leader>tmp", function()
      client:exec_cmd({

        title = "pin",

        command = "tinymist.pinMain",

        arguments = { vim.api.nvim_buf_get_name(0) },
      }, { bufnr = bufnr })
    end, { desc = "[T]iny[m]ist [P]in", noremap = true })

    vim.keymap.set("n", "<leader>tmu", function()
      client:exec_cmd({

        title = "unpin",

        command = "tinymist.pinMain",

        arguments = { vim.v.null },
      }, { bufnr = bufnr })
    end, { desc = "[T]iny[m]ist [U]npin", noremap = true })
  end,
  settings = {
    exportPdf = "onSave",
    fontPaths = { "fonts" }, -- relative to root directory of LSP
  },
})
vim.lsp.enable "tinymist"
