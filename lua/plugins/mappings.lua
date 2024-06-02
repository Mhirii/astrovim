local astro = require "astrocore"
local lazygit = {
  callback = function()
    local worktree = astro.file_worktree()
    local flags = worktree and (" --work-tree=%s --git-dir=%s"):format(worktree.toplevel, worktree.gitdir) or ""
    astro.toggle_term_cmd("lazygit " .. flags)
  end,
  desc = "ToggleTerm lazygit",
}
return {
  {
    "AstroNvim/astrocore",
    opts = function(_, opts)
      local maps = opts.mappings
      maps.n["<Leader>h"] = false
      local is_available = astro.is_available

      -- Toggle Term
      maps.n["<Leader>tf"] = false
      maps.n["<Leader>th"] = false
      maps.n["<Leader>tl"] = false
      maps.n["<Leader>tn"] = false
      maps.n["<Leader>tp"] = false
      maps.n["<Leader>tv"] = false
      maps.t["<M-i>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" }

      maps.n["<Leader>lg"] = { lazygit.callback, desc = lazygit.desc }
      maps.n["<M-i>"] = { "<Cmd>ToggleTerm direction=float<CR>", desc = "ToggleTerm float" }

      -- Buffer
      maps.n["<Leader>c"] = false
      maps.n["<Leader>C"] = false
      maps.n["<Leader>x"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" }
      maps.n["<S-l>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" }
      maps.n["<S-h>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" }

      --Quit
      maps.n["<Leader>q"] = false
      maps.n["<Leader>Q"] = false
      maps.n["<Leader>w"] = false
      --Alpha
      maps.n["<Leader>;"] = {
        function()
          local wins = vim.api.nvim_tabpage_list_wins(0)
          if #wins > 1 and vim.bo[vim.api.nvim_win_get_buf(wins[1])].filetype == "neo-tree" then
            vim.fn.win_gotoid(wins[2]) -- go to non-neo-tree window to toggle alpha
          end
          require("alpha").start(false)
        end,
        desc = "Home Screen",
      }

      -- telescope
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
      maps.n["<Leader>st"] =
        { function() require("telescope.builtin").colorscheme { enable_preview = true } end, desc = "Search themes" }
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
}
