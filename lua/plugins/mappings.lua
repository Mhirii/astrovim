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
      maps.n["<Leader>n"] = false
      maps.n["<Leader>o"] = false

      --lsp
      maps.n["gra"] = false
      maps.x["gra"] = false
      maps.n["grn"] = false
      maps.n["grr"] = false
      maps.n["<leader>lr"] = { function() vim.lsp.buf.rename() end, desc = "vim.lsp.buf.rename()" }
      maps.n["gr"] = { function() vim.lsp.buf.references() end, desc = "vim.lsp.buf.references()" }

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
    end,
  },
}
