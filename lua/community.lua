-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.game.leetcode-nvim" },

  { import = "astrocommunity.keybinding.nvcheatsheet-nvim" },

  -- { import = "astrocommunity.lsp.garbage-day-nvim" },
  { import = "astrocommunity.lsp.ts-error-translator-nvim" },

  { import = "astrocommunity.motion.marks-nvim" },

  { import = "astrocommunity.neovim-lua-development.lazydev-nvim" },

  { import = "astrocommunity.pack.bash" },
  { import = "astrocommunity.pack.cpp" },
  { import = "astrocommunity.pack.docker" },
  { import = "astrocommunity.pack.go" },
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.vue" },
  { import = "astrocommunity.pack.yaml" },

  { import = "astrocommunity.recipes.neovide" }, -- for scaling C- C+ C0
  { import = "astrocommunity.recipes.telescope-nvchad-theme" },
  { import = "astrocommunity.terminal-integration.vim-tmux-yank" },
  -- { import = "astrocommunity.test.neotest" },

  -- import/override with your plugins folder
}
