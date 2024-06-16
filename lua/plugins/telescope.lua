return {
  {
    "nvim-telescope/telescope.nvim",
    ependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local astro = require "astrocore"
          local maps = opts.mappings
        end,
      },
    },
    opts = function()
      local actions = require "telescope.actions"
      return {
        mappings = {
          i = {
            ["<C-J>"] = actions.cycle_history_next,
            ["<C-K>"] = actions.cycle_history_prev,
            ["<C-N>"] = actions.move_selection_next,
            ["<C-P>"] = actions.move_selection_previous,
          },
          n = { q = actions.close },
        },
      }
    end,
  },

  -- {
  --   "danielfalk/smart-open.nvim",
  --   branch = "0.2.x",
  --   dependencies = {
  --     "kkharji/sqlite.lua",
  --     -- Only required if using match_algorithm fzf
  --     { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  --     -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
  --     { "nvim-telescope/telescope-fzy-native.nvim" },
  --     {
  --       "AstroNvim/astrocore",
  --       opts = function(_, opts) end,
  --     },
  --   },
  -- },
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
}
