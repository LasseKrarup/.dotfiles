return {
  "Vigemus/iron.nvim",
  opts = function()
    local common = require "iron.fts.common"

    return {
      config = {
        -- Whether a repl should be discarded or not
        scratch_repl = true,
        -- Your repl definitions come here
        repl_definition = {
          sh = {
            -- Can be a table or a function that
            -- returns a table (see below)
            command = { "fish" },
          },
          python = {
            command = { "ipython", "--no-autoindent" }, -- or { "python3" }
            format = common.bracketed_paste_python,
            block_dividers = { "# %%", "#%%" },
            env = { PYTHON_BASIC_REPL = "1" }, --this is needed for python3.13 and up.
          },
          nix = {
            command = { "nix", "repl" },
          },
        },
        -- set the file type of the newly created repl to ft
        -- bufnr is the buffer id of the REPL and ft is the filetype of the
        -- language being used for the REPL.
        repl_filetype = function(bufnr, ft)
          return ft
          -- or return a string name such as the following
          -- return "iron"
        end,
        -- Send selections to the DAP repl if an nvim-dap session is running.
        dap_integration = true,
        -- How the repl window will be displayed
        -- See below for more information
        repl_open_cmd = "vertical botright 80 split",
        -- repl_open_cmd can also be an array-style table so that multiple
        -- repl_open_commands can be given.
        -- When repl_open_cmd is given as a table, the first command given will
        -- be the command that `IronRepl` initially toggles.
        -- Moreover, when repl_open_cmd is a table, each key will automatically
        -- be available as a keymap (see `keymaps` below) with the names
        -- toggle_repl_with_cmd_1, ..., toggle_repl_with_cmd_k
        -- For example,
        --
        -- repl_open_cmd = {
        --   view.split.vertical.rightbelow("%40"), -- cmd_1: open a repl to the right
        --   view.split.rightbelow("%25")  -- cmd_2: open a repl below
        -- }
      },
      -- If the highlight is on, you can change how it looks
      -- For the available options, check nvim_set_hl
      highlight = {
        italic = true,
      },
      ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
    }
  end,

  -- iron also has a list of commands, see :h iron-commands for all available commands
  keys = {
    -- Toggle and restart commands (r->i replacement)
    {
      "<leader>ii",
      "<cmd>IronRepl<cr>",
      desc = "Toggle REPL",
    },
    { "<leader>iI", "<cmd>IronRestart<cr>", desc = "Restart REPL" },

    -- Send commands (keep current mappings after <leader>i)
    {
      "<leader>isc",
      function()
        require("iron.core").send_motion()
      end,
      mode = "n",
      desc = "Send motion to REPL",
    },
    {
      "<leader>isc",
      function()
        require("iron.core").visual_send()
      end,
      mode = "v",
      desc = "Send visual selection to REPL",
    },
    {
      "<leader>isf",
      function()
        require("iron.core").send_file()
      end,
      desc = "Send file to REPL",
    },
    {
      "<leader>isl",
      function()
        require("iron.core").send_line()
      end,
      desc = "Send line to REPL",
    },
    {
      "<leader>isp",
      function()
        require("iron.core").send_paragraph()
      end,
      desc = "Send paragraph to REPL",
    },
    {
      "<leader>isu",
      function()
        require("iron.core").send_until_cursor()
      end,
      desc = "Send until cursor to REPL",
    },
    {
      "<leader>ism",
      function()
        require("iron.core").send_mark()
      end,
      desc = "Send mark to REPL",
    },
    {
      "<leader>isb",
      function()
        require("iron.core").send_code_block()
      end,
      desc = "Send code block to REPL",
    },
    {
      "<leader>isn",
      function()
        require("iron.core").send_code_block_and_move()
      end,
      desc = "Send code block and move to REPL",
    },

    -- Mark commands (keep current mappings after <leader>i)
    {
      "<leader>imc",
      function()
        require("iron.core").mark_motion()
      end,
      mode = "n",
      desc = "Mark motion",
    },
    {
      "<leader>imc",
      function()
        require("iron.core").mark_visual()
      end,
      mode = "v",
      desc = "Mark visual selection",
    },
    {
      "<leader>imd",
      function()
        require("iron.core").remove_mark()
      end,
      desc = "Remove mark",
    },

    -- Control commands (keep current mappings after <leader>i)
    {
      "<leader>is<cr>",
      function()
        require("iron.core").send_cr()
      end,
      desc = "Send carriage return to REPL",
    },
    {
      "<leader>is<space>",
      function()
        require("iron.core").interrupt()
      end,
      desc = "Interrupt REPL",
    },
    {
      "<leader>isq",
      function()
        require("iron.core").exit()
      end,
      desc = "Exit REPL",
    },
    {
      "<leader>icl",
      function()
        require("iron.core").clear()
      end,
      desc = "Clear REPL",
    },
    {
      "<leader><CR>",
      function()
        require("iron.core").send_code_block()
      end,
      desc = "Send code block to REPL",
      ft = { "python", "bash", "sh" },
    },

    -- Focus and hide commands (r->i replacement)
    { "<leader>if", "<cmd>IronFocus<cr>", desc = "Focus REPL" },
    { "<leader>ih", "<cmd>IronHide<cr>", desc = "Hide REPL" },
  },
  ft = { "python", "sh", "bash", "zsh" },
}
