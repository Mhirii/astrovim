-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      -- customize the dashboard header
      opts.section.header.val = {
        "	                                                                     ",
        "	                                                                   ",
        "	      ████ ██████           █████      ██                    ",
        "	     ███████████             █████                            ",
        "	     █████████ ███████████████████ ███   ███████████  ",
        "	    █████████  ███    █████████████ █████ ██████████████  ",
        "	   █████████ ██████████ █████████ █████ █████ ████ █████  ",
        "	 ███████████ ███    ███ █████████ █████ █████ ████ █████ ",
        "	██████  █████████████████████ ████ █████ █████ ████ ██████",
        "	                                                                     ",
      }
      return opts
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    event = "BufEnter",
    opts = {
      n_lines = 40,
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        find = "sf", -- Find surrounding (to the right)
        find_left = "sF", -- Find surrounding (to the left)
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
        update_n_lines = "sn", -- Update `n_lines`

        suffix_last = "l", -- Suffix to search with "prev" method
        suffix_next = "n", -- Suffix to search with "next" method
      },
    },
  },
  {
    "nguyenvukhang/nvim-toggler",
    event = { "User AstroFile", "InsertEnter" },
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = {
          mappings = {
            n = { ["<Leader>i"] = { function() require("nvim-toggler").toggle() end, desc = "Toggle CursorWord" } },
            v = { ["<Leader>i"] = { function() require("nvim-toggler").toggle() end, desc = "Toggle CursorWord" } },
          },
        },
      },
    },
    opts = {
      remove_default_keybinds = true,
    },
  },

  {
    "nacro90/numb.nvim",
    event = "VeryLazy",
    config = function()
      require("numb").setup {
        show_numbers = true, -- Enable 'number' for the window while peeking
        show_cursorline = true, -- Enable 'cursorline' for the window while peeking
        hide_relativenumbers = true, -- Enable turning off 'relativenumber' for the window while peeking
        number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
        centered_peeking = true, -- Peeked line will be centered relative to window
      }
    end,
  },
  {
    "rebelot/heirline.nvim",
    opts = function(_, opts) opts.winbar = nil end,
  },

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  -- {
  --   "L3MON4D3/LuaSnip",
  --   config = function(plugin, opts)
  --     require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
  --     -- add more custom luasnip configuration such as filetype extend or custom snippets
  --     local luasnip = require "luasnip"
  --     luasnip.filetype_extend("javascript", { "javascriptreact" })
  --   end,
  -- },
}
