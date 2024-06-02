return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local astro = require "astrocore"
          local maps = opts.mappings

          maps.n["<Leader>s"] = vim.tbl_get(opts, "_map_sections", "f")

          maps.n["<Leader>h"] = false
          local is_available = astro.is_available
          maps.n["<Leader>/"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }

          maps.n["<Leader>f<CR>"] = false
          maps.n["<Leader>s<CR>"] =
            { function() require("telescope.builtin").resume() end, desc = "Resume previous search" }
          maps.n["<Leader>f'"] = false
          maps.n["<Leader>s'"] = { function() require("telescope.builtin").marks() end, desc = "Search marks" }
          maps.n["<Leader>f/"] = false
          maps.n["<Leader>s/"] = {
            function() require("telescope.builtin").current_buffer_fuzzy_find() end,
            desc = "Search words in current buffer",
          }
          maps.n["<Leader>fa"] = false
          maps.n["<Leader>sa"] = {
            function()
              require("telescope.builtin").find_files {
                prompt_title = "Config Files",
                cwd = vim.fn.stdpath "config",
                follow = true,
              }
            end,
            desc = "Search AstroNvim config files",
          }
          maps.n["<Leader>fb"] = false
          maps.n["<Leader>sb"] = { function() require("telescope.builtin").buffers() end, desc = "Search buffers" }
          maps.n["<Leader>fc"] = false
          maps.n["<Leader>sc"] =
            { function() require("telescope.builtin").grep_string() end, desc = "Search word under cursor" }
          maps.n["<Leader>fC"] = false
          maps.n["<Leader>sC"] = { function() require("telescope.builtin").commands() end, desc = "Search commands" }
          maps.n["<Leader>ff"] = false
          maps.n["<Leader>sf"] = { function() require("telescope.builtin").find_files() end, desc = "Search files" }
          maps.n["<Leader>fF"] = false
          maps.n["<Leader>sF"] = {
            function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
            desc = "Search all files",
          }
          maps.n["<Leader>fh"] = false
          maps.n["<Leader>sh"] = { function() require("telescope.builtin").help_tags() end, desc = "Search help" }
          maps.n["<Leader>fk"] = false
          maps.n["<Leader>sk"] = { function() require("telescope.builtin").keymaps() end, desc = "Search keymaps" }
          maps.n["<Leader>fm"] = false
          maps.n["<Leader>sm"] = { function() require("telescope.builtin").man_pages() end, desc = "Search man" }
          if is_available "nvim-notify" then
            maps.n["<Leader>fn"] = false
            maps.n["<Leader>sn"] =
              { function() require("telescope").extensions.notify.notify() end, desc = "Search notifications" }
          end
          maps.n["<Leader>fo"] = false
          maps.n["<Leader>so"] = { function() require("telescope.builtin").oldfiles() end, desc = "Search history" }
          maps.n["<Leader>fr"] = false
          maps.n["<Leader>sr"] = { function() require("telescope.builtin").registers() end, desc = "Search registers" }
          maps.n["<Leader>ft"] = false
          maps.n["<Leader>st"] = {
            function() require("telescope.builtin").colorscheme { enable_preview = true } end,
            desc = "Search themes",
          }
          if vim.fn.executable "rg" == 1 then
            maps.n["<Leader>fw"] = false
            maps.n["<Leader>sw"] = { function() require("telescope.builtin").live_grep() end, desc = "Search words" }
            maps.n["<Leader>fW"] = false
            maps.n["<Leader>sW"] = {
              function()
                require("telescope.builtin").live_grep {
                  additional_args = function(args) return vim.list_extend(args, { "--hidden", "--no-ignore" }) end,
                }
              end,
              desc = "Search words in all files",
            }
          end

          maps.n["<Leader>fT"] = false
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

  {
    "danielfalk/smart-open.nvim",
    branch = "0.2.x",
    dependencies = {
      "kkharji/sqlite.lua",
      -- Only required if using match_algorithm fzf
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      -- Optional.  If installed, native fzy will be used when match_algorithm is fzy
      { "nvim-telescope/telescope-fzy-native.nvim" },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          maps.n["<Leader>f"] = {
            function() require("telescope").extensions.smart_open.smart_open { cwd_only = true, filename_first = true } end,
            desc = "Smart Open",
          }
        end,
      },
    },
    config = function()
      local telescope = require "telescope"
      telescope.load_extension "smart_open"
      telescope.setup {
        extensions = {
          smart_open = {
            match_algorithm = "fzf",
            disable_devicons = false,
            ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
          },
        },
      }
    end,
  },
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
}
