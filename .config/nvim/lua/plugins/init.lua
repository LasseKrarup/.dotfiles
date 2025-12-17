return {
  { "nvim-tree/nvim-web-devicons", opts = {} },
  { "echasnovski/mini.statusline", opts = {} },
  { "echasnovski/mini.move", opts = require "plugins.configs.mini.move" },
  { "echasnovski/mini.ai", opts = {} },
  { "echasnovski/mini.surround", opts = require "plugins.configs.mini.surround" },
  { "lewis6991/gitsigns.nvim", opts = {} },

  { "ellisonleao/gruvbox.nvim", opts = {} },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.configs.treesitter"
    end,
  },

  {
    "akinsho/bufferline.nvim",
    opts = require "plugins.configs.bufferline",
  },

  -- we use blink plugin only when in insert mode
  -- so lets lazyload it at InsertEnter event
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets",

      -- snippets engine
      {
        "L3MON4D3/LuaSnip",
        config = function()
          require("luasnip.loaders.from_vscode").lazy_load()
        end,
      },

      -- autopairs , autocompletes ()[] etc
      { "windwp/nvim-autopairs", opts = {} },
    },
    -- made opts a function cuz cmp config calls cmp module
    -- and we lazyloaded cmp so we dont want that file to be read on startup!
    opts = function()
      return require "plugins.configs.blink"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
    end,
    dependencies = {
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
      "saghen/blink.cmp",
      -- Remove nasty vim global warnings
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = require "plugins.configs.conform",
  },

  -- ── Debugging ───────────────────────────────────────────────────────
  {
    "sakhnik/nvim-gdb",
    init = function()
      -- Disable all the default start keymaps (<leader>dd, <leader>dl, etc.)
      vim.g.nvimgdb_disable_start_keymaps = 1
    end,
    keys = {
      {
        "<leader>dd",
        function()
          local gdb_path = os.getenv "GDB" or "gdb"
          vim.cmd("GdbStart " .. gdb_path .. " -q")
        end,
        desc = "Start GDB with quiet mode",
      },
    },
  },
  -- Snacks
  require "plugins.snacks",

  -- Session (persistence)
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    },
  },

  -- Trouble (diagnostics)
  require "plugins.trouble",

  -- Which-key
  require "plugins.whichkey",

  -- ── COMMENTS ────────────────────────────────────────────────────────
  -- CommentBox
  { "LudoPinelli/comment-box.nvim" },

  -- Highlight todo, notes, etc in comments
  {
    "folke/todo-comments.nvim",
    event = "VimEnter",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { signs = false },
  },
  -- ──────────────────────────────────────────────────────────────────────
  {
    "chomosuke/typst-preview.nvim",
    ft = "typst",
    version = "1.*",
    opts = {
      dependencies_bin = {
        ["tinymist"] = "tinymist",
        ["websocat"] = nil,
      },
      extra_args = { "--font-path", "fonts" },
    }, -- lazy.nvim will implicitly calls `setup {}`
  },

  -- ── File explorer and navigation ────────────────────────────────────
  {
    "stevearc/oil.nvim",
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
    -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
    lazy = false,
  },
  require "plugins.neotree",

  {
    "gbprod/yanky.nvim",
    opts = {},
    dependencies = { "folke/snacks.nvim" },
    keys = {
      {
        "<leader>p",
        function()
          Snacks.picker.yanky()
        end,
        mode = { "n", "x" },
        desc = "Open Yank History",
      },
    },
  },

  -- ── Code Assistant ──────────────────────────────────────────────────
  { "github/copilot.vim" },

  -- ── REPL ────────────────────────────────────────────────────────────
  require "plugins.iron",
}
