return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bitbake_ls = {},
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=**",
            "--clang-tidy",
            "--enable-config",
          },
        },
        neocmake = {
          init_options = {
            lint = {
              enable = false,
            },
          },
        },
        nil_ls = {
          formatting = {
            command = { "nixfmt" },
          },
        },
        html = {},
      },
    },
  },
}
