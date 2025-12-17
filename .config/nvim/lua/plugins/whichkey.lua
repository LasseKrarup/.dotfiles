-- configs/whichkey.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    preset = "classic",
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader><tab>", group = "Tabs" },
        { "<leader>c", group = "Code" },
        { "<leader>cm", group = "Commentbox" },
        { "<leader>d", group = "Debug" },
        { "<leader>dp", group = "Profiler" },
        { "<leader>f", group = "Find..." },
        { "<leader>g", group = "Git" },
        { "<leader>gh", group = "[G]it [H]unks" },
        { "<leader>i", group = "Iron REPL..." },
        { "<leader>is", group = "Send to REPL..." },
        { "<leader>q", group = "Quit/session" },
        { "<leader>s", group = "Search..." },
        { "<leader>t", group = "Typst..." },
        { "<leader>u", group = "UI", icon = { icon = "󰙵 ", color = "cyan" } },
        { "<leader>x", group = "Diagnostics/Quickfi[x]", icon = { icon = "󱖫 ", color = "green" } },
        { "[", group = "Prev" },
        { "]", group = "Next" },
        { "g", group = "Goto" },
        { "gs", group = "Surround" },
        { "z", group = "Fold" },
        {
          "<leader>b",
          group = "Buffer",
          expand = function()
            return require("which-key.extras").expand.buf()
          end,
        },
        {
          "<leader>w",
          group = "Windows",
          proxy = "<c-w>",
          expand = function()
            return require("which-key.extras").expand.win()
          end,
        },
        -- better descriptions
        { "gx", desc = "Open with system app" },
      },
    },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Keymaps (which-key)",
    },
    {
      "<c-w><space>",
      function()
        require("which-key").show({ keys = "<c-w>", loop = true })
      end,
      desc = "Window Hydra Mode (which-key)",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
