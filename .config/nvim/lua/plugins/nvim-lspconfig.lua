return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bitbake_ls = {},
        clangd = {
          cmd = {
            "clangd",
            "--query-driver=**/xtensa-esp32-elf-gcc,**/xtensa-esp32-elf-g++",
            "--clang-tidy",
            "--enable-config",
          },
        },
      },
    },
  },
}
