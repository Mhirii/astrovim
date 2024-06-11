return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      { "AstroNvim/astroui", opts = { icons = { Harpoon = "󱡀" } } },
      {
        "AstroNvim/astrocore",
        opts = function(_, opts)
          local maps = opts.mappings
          local term_string = vim.fn.exists "$TMUX" == 1 and "tmux" or "term"
          local prefix = "<Leader>h"
          local harpoon = require "harpoon"
          maps.n[prefix] = { desc = require("astroui").get_icon("Harpoon", 1, true) .. "Harpoon" }

          maps.n["<leader>1"] = { function() harpoon:list():select(1) end, desc = "Goto mark 1" }
          maps.n["<leader>2"] = { function() harpoon:list():select(1) end, desc = "Goto mark 2" }
          maps.n["<leader>3"] = { function() harpoon:list():select(1) end, desc = "Goto mark 3" }
          maps.n[prefix .. "1"] = { function() harpoon:list():select(1) end, desc = "Goto mark 1" }
          maps.n[prefix .. "2"] = { function() harpoon:list():select(2) end, desc = "Goto mark 2" }
          maps.n[prefix .. "3"] = { function() harpoon:list():select(3) end, desc = "Goto mark 3" }
          maps.n[prefix .. "4"] = { function() harpoon:list():select(4) end, desc = "Goto mark 4" }
          maps.n[prefix .. "5"] = { function() harpoon:list():select(5) end, desc = "Goto mark 5" }
          maps.n[prefix .. "6"] = { function() harpoon:list():select(6) end, desc = "Goto mark 6" }
          maps.n[prefix .. "7"] = { function() harpoon:list():select(7) end, desc = "Goto mark 7" }
          maps.n[prefix .. "8"] = { function() harpoon:list():select(8) end, desc = "Goto mark 8" }
          maps.n[prefix .. "9"] = { function() harpoon:list():select(9) end, desc = "Goto mark 9" }

          maps.n[prefix .. "a"] = { function() harpoon:list():add() end, desc = "Add file" }
          maps.n[prefix .. "e"] = {
            function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
            desc = "Toggle quick menu",
          }
          maps.n["<C-x>"] = {
            function()
              vim.ui.input({ prompt = "Harpoon mark index: " }, function(input)
                local num = tonumber(input)
                if num then harpoon:list():select(num) end
              end)
            end,
            desc = "Goto index of mark",
          }
          maps.n["<C-p>"] = { function() harpoon:list():prev() end, desc = "Goto previous mark" }
          maps.n["<C-n>"] = { function() harpoon:list():next() end, desc = "Goto next mark" }
          maps.n[prefix .. "m"] = { "<Cmd>Telescope harpoon marks<CR>", desc = "Show marks in Telescope" }
          maps.n[prefix .. "t"] = {
            function()
              vim.ui.input({ prompt = term_string .. " window number: " }, function(input)
                local num = tonumber(input)
                if num then harpoon.term.gotoTerminal(num) end
              end)
            end,
            desc = "Go to " .. term_string .. " window",
          }
        end,
      },
    },
  },
}
